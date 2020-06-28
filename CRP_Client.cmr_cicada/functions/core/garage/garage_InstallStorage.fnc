private ["_camera","_default","_upgrade"];
_camera = call garage_cam;

playsound "Drill";
for "_i" from 1 to 100 step 1 do {
		[format['Installing Upgrade... %1%2',_i,"%"],'\crp_data\images\items\exhaust',true]call tag_notify;
		uiSleep 0.02;
		if(!alive player)exitWith {};
};

_default = [(_this select 1)]call storage_maxkg;

_upgrade = switch(_this select 0)do
{
	case "dtk_Storage1":{20};
	case "dtk_Storage2":{30};
	case "dtk_Storage3":{40};
	case "dtk_Storage4":{80};
	case "dtk_Storage5":{120};
	case "dtk_Storage6":{150};
};

(_this select 1) setvariable ["dtk_upgrade",_default + _upgrade, true];
	
camDestroy _camera;
_camera cameraEffect ["terminate","back"];