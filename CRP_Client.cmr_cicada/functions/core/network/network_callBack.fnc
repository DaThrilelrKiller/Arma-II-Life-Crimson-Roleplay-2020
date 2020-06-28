private["_backUnit","_prams","_code","_backFunction","_return"];

_backUnit = _this select 0;
_prams = _this select 1;
_code = missionNamespace getVariable [_this select 2,{}];
_backFunction = _this select 3;

_return = _prams call _code;
[_backUnit,_return,_backFunction,false,false]call network_MPExec;