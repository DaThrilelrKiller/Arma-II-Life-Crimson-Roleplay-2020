private ["_return"];
_return = ((_this call config_array) select 0);
_return = [_return,""]select isNil "_return";
_return