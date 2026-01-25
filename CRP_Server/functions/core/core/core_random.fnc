private ["_min","_max","_return"];
_min = _this select 0;
_max = _this select 1;

_return = random _max;
if (_return < _min)then {
_return = _this call core_random;
};

_return



