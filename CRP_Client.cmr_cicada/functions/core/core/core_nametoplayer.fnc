﻿private ["_return"];

_return = {
if (name _x == _this)exitWith {_x};
_return = objNull;
}forEach playableUnits;

_return