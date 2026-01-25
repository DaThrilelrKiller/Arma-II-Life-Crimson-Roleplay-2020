private ["_data","_Scriptname","_plate","_spawn","_vehicle","_info"];

ctrlEnable [221, false];

_data = call compile (lbData [1, (lbCurSel 1)]); 
_info = _data select 0;

_Scriptname = _info select 0;
_plate = _info select 5;
_spawn = []call vehicle_findSpawn;

_vehicle = [_Scriptname,_spawn,player,dtk_side,_plate]call shops_createVehicle;
[_vehicle,_data]spawn vehicle_setData;

closeDialog 0;