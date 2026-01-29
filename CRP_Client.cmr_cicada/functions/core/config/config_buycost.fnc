private ["_return"];
_return = [_this call config_array,[3,0]]call core_selectNested;
_return = if (isNil "_return" || {typeName _return != "SCALAR"})then {0}else{_return};
_return