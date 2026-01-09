private ["_camera"];

if ([(_this select 1),["Motorcycle", "Ship", "Air"]]call core_isKindOf)exitWith {
	systemchat "Speed upgrades can not be installed on this vehicle";
};


_camera = call garage_cam;

playsound "Drill";
for "_i" from 1 to 100 step 1 do {
		[format['Installing Upgrade... %1%2',_i,"%"],'data\images\items\exhaust',true]call tag_notify;
		uiSleep 0.1;
		if(!alive player)exitWith {};
};

_upgrade = switch(_this select 0)do
{
	case "dtk_Speed1":{1.006};
	case "dtk_Speed2":{1.008};
	case "dtk_Speed3":{1.010};
	case "dtk_Speed4":{1.012};
	case "dtk_Speed5":{1.014};
	case "dtk_Speed6":{1.018};
};

(_this select 1) setvariable ["tuning",_upgrade, true];
	

camDestroy _camera;
_camera cameraEffect ["terminate","back"];