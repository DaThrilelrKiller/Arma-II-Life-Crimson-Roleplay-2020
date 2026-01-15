private ["_pole","_camera","_item","_advanced","_side","_pos","_direction"];

_item = _this select 1;
_side = _this select 3;
_pos = _this select 4;
_direction = _this select 5;

_side = [_side,dtk_side]select isNil "_side";
_pos = [_pos,getPos player]select isNil "_pos";
_direction = [_direction,getDir player]select isNil "_direction";

_advanced = [false,true]select (_item in ["camera_advanced"]);

_pole = "MAP_sloupyelA" createVehicle [0,0,0];
_camera = "MAP_misc_videoprojector" createVehicle [0,0,0];
_camera attachTo [_pole,[0.4,0.14,2.41]];

_pole setPos _pos;
_pole setDir _direction;
_camera setVariable ["camera",[_advanced,_side],true];

[player,_item,-1] call storage_add;
