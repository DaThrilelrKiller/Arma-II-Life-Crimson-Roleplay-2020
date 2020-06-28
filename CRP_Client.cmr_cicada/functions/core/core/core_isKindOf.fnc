private ["_object","_kinds","_return"];

_object = _this select 0;
_kinds = _this select 1;
_return = false;

{
if (_object isKindOf _x || {typeOf _object == _x})then {_return = true};
}forEach _kinds;

_return