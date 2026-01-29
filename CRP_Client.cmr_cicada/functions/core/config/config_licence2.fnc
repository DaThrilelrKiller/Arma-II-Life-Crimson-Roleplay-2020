private ["_return"];
_return = [_this call config_array,[4,2]]call core_selectNested;
_return = if (isNil "_return")then {""}else{_return};

_return