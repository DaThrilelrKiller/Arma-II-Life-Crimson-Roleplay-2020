private ["_pos","_camera"];

_pos = (getPosATL (vehicle player));
_camera = "camera" camCreate _pos;

showCinemaBorder false;
_camera camPrepareTarget (vehicle player);
_camera cameraEffect ["Internal", "LEFT"];
_camera camPreparePos [(_pos select 0) + 10, (_pos select 1) + 5, ((_pos select 2) + 4)];
 _camera camSetDir direction (vehicle player);
_camera camPrepareFOV 1;

_camera camCommitPrepared 5;

_camera