private ["_choice"];

_choice = _this select 0;
switch _choice do {
	case 1: {
		dtk_CamOffsetX = 0;
		dtk_CamOffsetY = 0;
		dtk_CamZoomX = 3.5;
		dtk_CamZoomY = 0;
		dtk_CamDir = 1;
	};
	case 2: {
		dtk_CamOffsetX = 0;
		dtk_CamOffsetY = 0;
		dtk_CamZoomX = -3.5;
		dtk_CamZoomY = 0;
		dtk_CamDir = 2;
	};
	case 3: {
		dtk_CamOffsetX = 0;
		dtk_CamOffsetY = 0;
		dtk_CamZoomX = 0;
		dtk_CamZoomY = -3.5;
		dtk_CamDir = 3;
	};
	case 4: {
		dtk_CamOffsetX = 0;
		dtk_CamOffsetY = 0;
		dtk_CamZoomX = 0;
		dtk_CamZoomY = 3.5;
		dtk_CamDir = 4;
	};
};

paint_cam camSetTarget [(getPos paint_temp_vehicle select 0) + dtk_CamOffsetX, (getPos paint_temp_vehicle select 1) + dtk_CamOffsetY, 31];
paint_cam camSetRelPos [dtk_CamZoomX, dtk_CamZoomY, 0.5];
paint_cam camCommit 0.5;