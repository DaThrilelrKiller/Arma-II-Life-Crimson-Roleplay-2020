private ["_return"];
_return = [_this call config_array,[1,1]]call core_selectNested;
_return = if (isNil "_return")then {"n/a"}else{_return};

_return