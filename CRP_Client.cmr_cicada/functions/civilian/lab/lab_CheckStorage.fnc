private ["_storage","_arrayitems","_arrayamount"];

_storage = _this getVariable ["dtk_storage",[[],[]]];

_arrayitems = _storage select 0;
_arrayamount = _storage select 1;

{
	if ((["drug","food"] find (_x call config_kind)) < 0)exiTWith{false};
	true
}foreach _arrayitems;
