private ["_return"];
_return = [_this call config_array,[4,0]]call core_selectNested;
_return = if (isNil "_return")then {0}else{_return};
_return