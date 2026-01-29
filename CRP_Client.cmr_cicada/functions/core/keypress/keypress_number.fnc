private ["_key","_return"];

_key = _this;
if (typeName _key == "SCALAR")exitWith {_key};

_return = {
	if (_key == (_x select 0))exitWith {(_x select 1)};
}forEach dtk_keypress_keys;

_return


