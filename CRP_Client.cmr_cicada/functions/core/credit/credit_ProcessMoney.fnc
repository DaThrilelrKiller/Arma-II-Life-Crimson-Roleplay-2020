// Integrated payment processor that checks wallet, bank, debit card, and credit card
// Usage: [_cost, _buy, _item, _amount] call credit_ProcessMoney;
// Returns true if payment successful, false otherwise
private ["_cost","_buy","_item","_amount","_hasDebitCard","_hasCreditCard","_wallet","_bank","_total","_creditAvailable","_return"];

_cost = _this select 0;
_buy = _this select 1;
_item = if (count _this > 2) then {_this select 2} else {""};
_amount = if (count _this > 3) then {_this select 3} else {1};

_return = false;
_hasDebitCard = ([player,"Debit_Card"] call storage_amount > 0);
_hasCreditCard = ([player,"Credit_Card"] call storage_amount > 0) && credit_hasCard;
_wallet = [player,"geld"] call storage_amount;
_bank = dtk_bank;
_total = _wallet + _bank;

// Calculate available credit if credit card is available
_creditAvailable = 0;
if (_hasCreditCard) then {
	_creditAvailable = credit_cardLimit - credit_cardBalance;
	_total = _total + _creditAvailable;
};

// Check if player has enough total funds (wallet + bank + credit)
if (_cost > _total) exitWith {
	_return
};

// Try payment methods in order: Wallet -> Bank -> Credit Card -> Debit Card
if (_buy) then {
	// Try wallet first
	if (_wallet >= _cost) then {
		[player,"geld",-_cost] call storage_add;
		systemChat format ["Paid %1 from wallet", [_cost] call Main_FormatMoney];
		_return = true;
	}
	// Try bank account (if has debit card)
	else {
		if (_hasDebitCard && _bank >= _cost) then {
			dtk_bank = dtk_bank - _cost;
			systemChat format ["Paid %1 from bank account", [_cost] call Main_FormatMoney];
			_return = true;
		}
		// Try credit card
		else {
			if (_hasCreditCard && _creditAvailable >= _cost) then {
				if ([_cost] call credit_processPayment) then {
					_return = true;
				};
			}
			// Try combination: wallet + bank
			else {
				if (_hasDebitCard) then {
					private ["_walletPay","_bankPay"];
					_walletPay = _wallet;
					_bankPay = _cost - _walletPay;
					
					if (_bankPay <= _bank && _bankPay > 0) then {
						[player,"geld",-_walletPay] call storage_add;
						dtk_bank = dtk_bank - _bankPay;
						systemChat format ["Paid %1 (Wallet: %2, Bank: %3)", [_cost] call Main_FormatMoney, [_walletPay] call Main_FormatMoney, [_bankPay] call Main_FormatMoney];
						_return = true;
					};
				}
				// Try combination: wallet + credit card
				else {
					if (_hasCreditCard) then {
						private ["_walletPay","_creditPay"];
						_walletPay = _wallet;
						_creditPay = _cost - _walletPay;
						
						if (_creditPay <= _creditAvailable && _creditPay > 0) then {
							[player,"geld",-_walletPay] call storage_add;
							if ([_creditPay] call credit_processPayment) then {
								systemChat format ["Paid %1 (Wallet: %2, Credit Card: %3)", [_cost] call Main_FormatMoney, [_walletPay] call Main_FormatMoney, [_creditPay] call Main_FormatMoney];
								_return = true;
							};
						};
					};
				};
			};
		};
	};
} else {
	// Just checking if player can afford (not actually buying)
	_return = true;
};

_return
