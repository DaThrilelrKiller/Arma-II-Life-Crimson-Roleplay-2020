private ["_shop","_shopData","_data","_buy","_sell","_return","_bool"];
_shop = _this select 0;
_shopData = _shop getVariable ["shop_data", []];

if (count _shopData == 0) exitWith {false};

_data = _shopData select 2;

_return = false;
{
	private ["_buy","_sell","_hasIllegal"];
	if (isNil "_x" || {typeName _x != "ARRAY"})exitWith {};
	if (count _x < 3)exitWith {};
	
	_buy = (_x select 1);
	_sell = (_x select 2);
	
	if (isNil "_buy" || {typeName _buy == "STRING"})exitWith {};
	if (isNil "_sell")exitWith {};
	
	_buy = +_buy; 
	_sell = +_sell; 
	
	{
		if !(_x in _buy)then {
			_buy set [count _buy,_x];
		};
	}count _sell;
	
	
	_hasIllegal = false;
	{
		 if (_x call config_illegal)exitWith {_hasIllegal = true;};
	}foreach _buy;
	
	if (_hasIllegal)exitWith {_return = true;};
}foreach _data;


if (isNil "_return")exitWith {false};
_return