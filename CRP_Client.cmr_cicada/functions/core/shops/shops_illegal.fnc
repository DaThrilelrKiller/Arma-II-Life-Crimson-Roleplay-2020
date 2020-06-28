private ["_shop","_index","_data","_buy","_sell","_return","_bool"];
_shop = _this select 0;
_index = _shop getVariable ["shop_data",""];

if (typeName _index == "STRING")exitWith {};

_data = (INV_ItemShops select _index)select 2;

_return = {
	private ["_buy","_sell"];
	_buy = (_x select 1);
	_sell = (_x select 2);
	if (typeName _buy == "STRING")exitWith {};
	_buy = +_buy; 
	_sell = +_sell; 
	
	{
		if !(_x in _buy)then {
			_buy set [count _buy,_x];
		};
	}count _sell;
	
	
	_return = {
		 if (_x call config_illegal)exitWith {true};
		 false
	}foreach _buy;
	
	if (_return)exitWith {_return};
	
}foreach _data;


if (isNil "_return")exitWith {false};
_return