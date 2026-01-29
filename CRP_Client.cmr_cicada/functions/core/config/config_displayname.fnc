private ["_return"];
_return = [_this call config_array,[2,1]]call core_selectNested;
_return = if (isNil "_return")then {_this}else{_return};

_return