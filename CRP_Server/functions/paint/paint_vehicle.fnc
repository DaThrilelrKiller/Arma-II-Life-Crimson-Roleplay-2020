paint_unit = (vehicle player);
paint_type = typeOf paint_unit;

dtk_platform = "platform" createVehicleLocal [11050.1,12757.4,15];
paint_temp_vehicle = paint_type createVehicleLocal [11050.1,12757.4,30];
paint_temp_vehicle enableSimulation false;
dtk_platform setPos [11050.1,12757.4,15];
paint_temp_vehicle setPos [11050.1,12757.4,30];


paint_unit call paint_current;

paint_cam = "Camera" camCreate [0, 0, 0];
paint_cam cameraEffect ["internal", "front"];
paint_cam camSetTarget [(getPos paint_temp_vehicle select 0) + 0, (getPos paint_temp_vehicle select 1) + 0, 31];
paint_cam camSetRelPos [3.5, 0, 0];
paint_cam camCommit 0;