if (count _this == 0)exitWith {
	if !(isNil "DTK_Panic_disabled")exitWith {
		systemchat "Your panic button is currently unavalible";
	};

	if (isNil "DTK_Panic")then {
		DTK_Panic = time;
	}else{
		if (time - DTK_Panic < 3 && {alive player} && {lifeState player != "UNCONSCIOUS"})then {
			["ALL",[player],"police_panic",true,true]call network_MPExec;
			DTK_Panic_disabled = true;
		}else{
			DTK_Panic = time;
		};
	};
};

if (dtk_cop)then {
	_unit = _this select 0;
	_name = name _unit;
	
	_marker = createMarkerLocal [("Backup_" + _name), getPos _unit];
	_marker setMarkerShapeLocal "ICON";
	_marker setMarkerTypeLocal "Warning";
	_marker setMarkerColorLocal "ColorRed";
	_marker setMarkerTextLocal "Officer Requested Backup Here!";
	
	player sideChat format["(%1) Has hit their panic button, they need immediate backup! Their location has been marked on the map via a map marker! GRID: %2",_name,mapGridPosition _unit];
	playSound "beepsimple";
	
	if (_unit == player)then {
		player sidechat "Your panic button is now disabled. It will be available in 60 seconds.";
		uiSleep 60;
		DTK_Panic_disabled = nil;
		player sidechat "Your panic button is now available.";
		deleteMarker ("Backup_" + _name);
	};
};