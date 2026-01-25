private ["_vehicle","_uids","_return","_keys","_data"];

_vehicle = _this;
_data = _vehicle getVariable "dtk_keys";
_return = false;


if (isNil "_data")exitWith {true};

_uids = uids;
_keys = _vehicle getVariable ["dtk_keys",[]];

{
	if (_x in _uids)then {_return = true};
}forEach _keys;

_return

