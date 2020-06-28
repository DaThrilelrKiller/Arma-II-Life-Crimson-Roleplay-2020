private ["_item","_amount"];

_item   = _this select 1;
_amount = _this select 2;

systemchat "test";

_laced = missionNamespace getVariable _item;
_laced = _laced select 6;

_items = _laced select 0;
_amount1 = _laced select 1;

if (isNil "_laced")exitWith {};
[player,_item,-1] call storage_add;

{
	_filename = _x call config_code;
	
	if (isNil format ["%1",_filename])then {
		["use", _x, (_amount1 select _forEachIndex)] execVM format["functions\items\%1.sqf",_filename];
	}else{
		["use", _x, (_amount1 select _forEachIndex)]spawn call compile _filename;
	};
}forEach _items;