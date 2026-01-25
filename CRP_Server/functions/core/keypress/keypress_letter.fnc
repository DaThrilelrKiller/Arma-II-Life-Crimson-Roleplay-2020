/* Gathers data from pre-defined key settings array that corasponds to the correct key number */

private ["_key","_return"];

_key = _this;
if (typeName _key == "STRING")exitWith {_key};

{
	if (_key == (_x select 1))then {_return = (_x select 0)};
	true;
}count dtk_keypress_keys;

_return


