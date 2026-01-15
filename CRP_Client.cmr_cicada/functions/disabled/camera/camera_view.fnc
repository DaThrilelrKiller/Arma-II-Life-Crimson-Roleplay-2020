private ["_data"];

if (v_camera_bool)exitWith {
	v_camera cameraEffect ["terminate","back"];
	camDestroy v_camera;
	v_camera_bool = false;
};


_data = call compile(lbData [16, (lbCurSel 16)]);
v_active_cam = v_cam_array select (_data - 1);
	
v_camera = "camera" camCreate [position v_active_cam select 0, position v_active_cam select 1, position v_active_cam select 2];
v_camera cameraEffect ["internal", "BACK"];
v_camera SetDir (getDir v_active_cam + 90);
v_camera camCommit 1;
showCinemaBorder false;
v_camera_bool = true;