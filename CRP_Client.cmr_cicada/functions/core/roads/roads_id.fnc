private ["_road","_array","_return"];

_road = _this;
_array = toArray _road;
_return = [];

{
if (_x == 58)exitWith {_return};
_return set [count _return,_x];
}count _array;

_return = parseNumber (toString _return);
_return