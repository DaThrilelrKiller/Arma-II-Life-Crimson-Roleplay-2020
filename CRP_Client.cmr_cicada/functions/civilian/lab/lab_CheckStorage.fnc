private ["_storage","_arrayitems","_arrayamount"];

_storage = _this getVariable ["dtk_storage",[[],[]]];

_arrayitems = _storage select 0;
_arrayamount = _storage select 1;

{
	if !(_x call config_kind in ["drug","food"])exiTWith{false};
	true
}foreach _arrayitems;
