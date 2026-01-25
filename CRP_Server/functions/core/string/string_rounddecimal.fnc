private ["_array","_return"];

if (_this == 1)exitWith {"100"};

_array = toarray str _this;
_return = format ['%1%2', toString [_array select 2],toString [_array select 3]];
_return
