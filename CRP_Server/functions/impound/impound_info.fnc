private ["_amount","_items","_data","_trunk","_upgrade","_weapons","_magazines","_plate","_sirens"];

lbClear 6;
lbClear 4;
lbClear 3;


_data = parseNumber (lbData [1,(lbCurSel 1)]);
_data = v_impound select _data;

_trunk = _data select 1;
_items = _trunk select 0;
_amount = _trunk select 1;
_upgrade = _data select 2;
_weapons = _data select 3;
_magazines = _data select 4;
_plate = _data select 5;
_sirens = _data select 9;
 
{
	lbAdd [6, format ["%1 %2",_x call config_displayname,_amount select _ForEachIndex]];
}forEach _items;

{
	_item = _weapons select 0 select _forEachIndex;
	_amount = _weapons select 1 select _forEachIndex;
	lbAdd [4, format ["%1 %2",_item call config_displayname,_amount]];
}forEach _weapons;

{
	_item = _magazines select 0 select _forEachIndex;
	_amount = _magazines select 1 select _forEachIndex;
	lbAdd [4, format ["%1 %2",_item call config_displayname,_amount]];
}forEach _magazines;

{
	lbAdd [3, _x call config_displayname];
}forEach _sirens;

lbAdd [2, format ["Upgrade: %1",_upgrade]];
lbAdd [2, format ["Plate: %1",_plate]];