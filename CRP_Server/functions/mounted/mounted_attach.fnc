private["_player", "_vehicle", "_offset"];
_player = _this select 0;
_vehicle = _this select 1;
_offset = _this select 2;

_player attachTo [_vehicle, _offset];