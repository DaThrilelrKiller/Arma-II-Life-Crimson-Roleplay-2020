// Pay selected ticket from civilian court menu
private ["_lb","_sel","_data","_idx","_t","_reason","_amount","_money","_total","_bankNeed","_cashPay"];

_lb = 7101;
_sel = lbCurSel _lb;
if (_sel < 0) exitWith { systemChat "Select a ticket first."; };

_data = lbData [_lb, _sel];
if (_data == "") exitWith { systemChat "Invalid ticket selection."; };

_idx = parseNumber _data;
if (isNil "court_myTickets") exitWith { systemChat "No tickets found."; };
if (_idx >= count court_myTickets) exitWith { systemChat "Invalid ticket selection."; };

_t = court_myTickets select _idx;
if ((typeName _t) != "ARRAY" || {count _t < 6}) exitWith { systemChat "Invalid ticket data."; };

_reason = _t select 3;
_amount = _t select 4;

_money = [player,"geld"] call storage_amount;
_total = _money + dtk_bank;

if (_total < _amount) exitWith {
	systemChat "You do not have enough money to pay this ticket.";
};

// Deduct: take from cash first, remainder from bank
_cashPay = if (_amount >= _money) then {_money} else {_amount};
_bankNeed = _amount - _cashPay;

if (_cashPay > 0) then {
	[player,'geld', -(_cashPay)] call storage_add;
};
if (_bankNeed > 0) then {
	dtk_bank = dtk_bank - _bankNeed;
};

// Remove ticket from list
court_myTickets set [_idx, "REMOVE"];
court_myTickets = court_myTickets - ["REMOVE"];

// Save tickets to server
["SERVER", [player, court_myTickets], "S_Court_saveTickets", false, false] call network_MPExec;

// Notify
["ALL", [format["%1 paid a ticket: $%2 for %3", name player, [_amount] call main_formatMoney, _reason]], "network_chat", false, true] call network_MPExec;

systemChat format ["Ticket paid: $%1 for %2", [_amount] call main_formatMoney, _reason];
[] call court_loadCivMenu;

