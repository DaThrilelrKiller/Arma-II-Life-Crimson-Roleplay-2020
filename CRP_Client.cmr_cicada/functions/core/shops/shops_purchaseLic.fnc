private ["_cost","_lic","_name","_hascard","_bank","_money","_return"];
_cost = _this select 0;
_lic = _this select 1;
_name = _this select 2;
_hascard = if ([player,"Debit_Card"] call storage_amount > 0)then {true}else {false};
_bank = dtk_bank;
_money = ([player,"geld"] call storage_amount);
_return = false;


/*checks your walet*/
if (_money > _cost)then 
{
	[player,"geld",(_money - _cost)]call storage_setAmount;
	systemChat format ["You bought %1 with %2 from your walet",_name,_cost];
	[player,_lic] call licenses_add;
	_return = true;
}
else
{
	/*Checks your bank*/
	if (_hascard &&{_bank > _cost})then 
	{
		dtk_bank = dtk_bank - _cost;
		systemChat format ["You bought %1 with %2 from your bank",_name,_cost];
		[player,_lic] call licenses_add;
		_return = true;
	};
};


if (!_return)then {
systemChat format ["You do not have enough money for %1 %2$",_name,_cost];
};


_return