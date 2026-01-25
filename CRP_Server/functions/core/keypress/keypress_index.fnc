private ["_key","_index","_return"];
_key = call compile _this;

{
	_index = (_x select 1);
	if (_key == _index)then {_return = _forEachIndex};
	true;
}forEach dtk_keypress_keys;

if (isNil "_return")then {
(format ["[ERROR] Key: %1 does not exsist  as a key in the keybinding library",_key])call {};
};

_return