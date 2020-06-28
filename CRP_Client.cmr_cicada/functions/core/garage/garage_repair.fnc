
private ["_vehicle","_option","_camera"];

_vehicle = _this select 1;
_option = _this select 0;


_camera = call garage_cam;

if (_option == "dtk_repair")then {
	playsound "Drill";
	for "_i" from 1 to 100 step 1 do {
			[format['Repairing you rusy POS... %1%2',_i,"%"],'\crp_data\images\items\exhaust',true]call tag_notify;
			uiSleep 0.1;
			if(!alive player)exitWith {};
			if (_i == 100)exitWith {
				_vehicle setDamage 0;
				systemchat "Your vehicle has been repaired! By Da";
			};
	};
};

if (_option == "dtk_refual")then {
	for "_i" from 1 to 100 step 1 do {
			[format['Refueling Vehicle... %1%2',_i,"%"],'\crp_data\images\items\exhaust',true]call tag_notify;
			uiSleep 0.1;
			if(!alive player)exitWith {};
			if (_i == 100)exitWith {
				_vehicle setFuel 1;
				systemchat "Your vehicle has been refueled! By Da";
			};
	};

};

camDestroy _camera;
_camera cameraEffect ["terminate","back"];