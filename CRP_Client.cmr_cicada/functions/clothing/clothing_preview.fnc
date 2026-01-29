if (count _this == 1)then {
	paint_type = typeOf (_this select 0);
}else{
	paint_type = lbData[150,lbCurSel 150];
	paint_type = paint_type call config_class;
};

if (!isNull paint_temp_vehicle)then {
	deletevehicle paint_temp_vehicle;
};

dtk_paint = [];
dtk_default = [];

dtk_platform = "platform" createVehicleLocal [11050.1,12757.4,15];

paint_temp_vehicle = paint_type createVehicleLocal [11050.1,12757.4,30];
paint_temp_vehicle enableSimulation false;
dtk_platform setPos [11050.1,12757.4,15];
paint_temp_vehicle setPos [11050.1,12757.4,30];


paint_cam camSetTarget [(getPosATL paint_temp_vehicle select 0) + 0, (getPosATL paint_temp_vehicle select 1) + 0, 31];
paint_cam camSetRelPos [3.5, 0, 0];
paint_cam camCommit 0;

lbClear 1500;

_selections = getArray (configFile >> "CfgVehicles" >> paint_type >> "hiddenselectionsTextures");
			
{
	_index	= lbAdd [1500, format["%1",_forEachIndex]];
	dtk_paint set [_forEachIndex,""];
	dtk_default set [_forEachIndex,_x];
} foreach _selections;	
	
if (count _this == 1)then {
	(_this select 0)call paint_current;
};

lbSetCurSel [1500, 0];