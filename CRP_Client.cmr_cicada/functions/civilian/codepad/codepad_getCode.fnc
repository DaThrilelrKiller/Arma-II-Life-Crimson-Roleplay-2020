private ["_lenght","_object","_array","_return","_code"];

_lenght = _this select 0;
_object = _this select 1;

_code =  _object getVariable "dtk_code";
if !(isNil "_code")exitWith {
	_code
};

_array = [0,1,2,3,4,5,6,7,8,9];
_return = "";

for [{_i = 0}, {_i < _lenght}, {_i=_i+1}] do {
    _return = _return + str(_array select (random (count _array - 1)));
};

_object setVariable ['dtk_code',_return,true];

_return
