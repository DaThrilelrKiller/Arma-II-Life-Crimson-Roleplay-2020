private ["_return"];
_return = [_this call config_array,[5,0]]call core_selectNested;
_return = if (isNil "_return")then {true}else{_return};

_return