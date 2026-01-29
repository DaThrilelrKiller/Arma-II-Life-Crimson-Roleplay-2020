private["_player", "_vehicle"];
_player = _this select 0;
_vehicle = _this select 1;
if (((vehicle _player) == _vehicle) && (_vehicle != _player)) exitWith {true};

private["_inMountedSlot"];
_inMountedSlot = _player getVariable "inMountedSlot";
if (isNil "_inMountedSlot") exitWith {false};
if (typeName _inMountedSlot != "BOOL") exitWith {false};
_inMountedSlot