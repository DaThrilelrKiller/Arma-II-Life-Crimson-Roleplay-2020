private ["_cost","_buy","_hascard","_return","_bank","_money","_total","_item","_name","_amount"];

_cost = _this select 0;
_buy = _this select 1;
_item = _this select 2;
_amount = _this select 3;
_name         = (_item call config_displayname);
_hascard = ([player,"Debit_Card"] call storage_amount > 0);
_return = false;
_bank = dtk_bank;
_money = ([player,"geld"] call storage_amount );
_total = _bank + _money;
_total = if (_hascard)then {_total}else {_money};


/*simple check to see if you have enough in total*/
if (_cost > _total)exitWith {_return};

/*checks your walet*/
if (_money >= _cost)then 
{
	if (_buy) then 
	{
		[player,"geld",-_cost] call storage_add;
		systemChat format ["You bought %3 %1 with %2 from your wallet",_name,_cost,_amount];
	};
	_return = true;
}
else
{
	/*Checks your bank*/
	if (_hascard &&{_bank > _cost})then 
	{
		if (_buy) then 
		{
			dtk_bank = dtk_bank - _cost;
			systemChat format ["You bought %3 %1 with %2 from your bank",_name,_cost,_amount];
		};
		_return = true;
	};
};

_return






