private ["_choice"];
_choice = _this select 0;

switch _choice do {
	case 1:{
		switch dtk_CamDir do {
			case 1:{
				if (dtk_CamZoomX > 0.5) Then {dtk_CamZoomX = dtk_CamZoomX - 0.5};
			};
			case 2:{
				if (dtk_CamZoomX < -0.5) Then {dtk_CamZoomX = dtk_CamZoomX + 0.5};
			};
			case 3:{
				if (dtk_CamZoomY < -0.5) Then {dtk_CamZoomY = dtk_CamZoomY + 0.5};
			};
			case 4:{
				if (dtk_CamZoomY > 0.5) Then {dtk_CamZoomY = dtk_CamZoomY - 0.5};
			};
		};
	};
	case 2:{
		switch dtk_CamDir do {
			case 1:{
				if (dtk_CamZoomX < 10) Then {dtk_CamZoomX = dtk_CamZoomX + 0.5};
			};
			case 2:{
				if (dtk_CamZoomX > -10) Then {dtk_CamZoomX = dtk_CamZoomX - 0.5};
			};
			case 3:{
				if (dtk_CamZoomY > -10) Then {dtk_CamZoomY = dtk_CamZoomY - 0.5};
			};
			case 4:{
				if (dtk_CamZoomY < 10) Then {dtk_CamZoomY = dtk_CamZoomY + 0.5};
			};
		};
	};
};

paint_cam camSetTarget [(getPosATL paint_temp_vehicle select 0) + dtk_CamOffsetX, (getPosATL paint_temp_vehicle select 1) + dtk_CamOffsetY, 31];
paint_cam camSetRelPos [dtk_CamZoomX, dtk_CamZoomY, 0];
paint_cam camCommit 0.5;