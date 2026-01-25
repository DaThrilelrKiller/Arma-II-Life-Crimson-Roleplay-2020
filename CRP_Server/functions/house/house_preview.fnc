
_this = call compile (lnbData [1501, [lnbCurSelRow 1501, 0]]);
_marker = _this select 0;

if !(isNil "house_cam")then {
	house_cam cameraEffect ['terminate','back'];
};
house_cam = "Camera" camCreate (getMarkerPos _marker);
house_cam cameraEffect ["internal", "front"];
house_cam camSetTarget (getMarkerPos _marker);
house_cam camSetRelPos [15, 15, 15]; 
house_cam camCommit 0.5;