if(capturing) exitWith {
    hint "Please Wait, you are already capturing!";
};
    
    private["_curOwner", "_zone", "_zonePole", "_zoneFlag", "_capCancelled", "_oldColor"];
    _zone = _this select 0;
	_zonePole = _this select 1;
	_zoneFlag = _this select 2;
	_oldColor = getMarkerColor _zone;
    
	if (_oldColor == "ColorWhite") exitWith {
		hint "Someone is already capturing the zone";
	};
	
    _curOwner = [_zoneFlag] call zone_owner;
	if(!(call INV_isArmed)) exitWith {
		hint "You must be armed to capture or neutralize points!";
	};
    
    capturing = true;
	[_zone, "ColorWhite"] call zone_setCapping;
	_capCancelled = false;
    _lockpos = getPosASL player;
	
	_text = if (_curOwner == "") then {"Capturing"}else{"Neutralizing"};
	
	for "_i" from 1 to 100 step 1 do {
		if (animationstate player != "AinvPknlMstpSlayWrflDnon_medic")then {
			["ALL",[player,"AinvPknlMstpSlayWrflDnon_medic"],"network_SwitchMove",false,true]call network_MPExec;	
		};
		
		[format['%3... %1%2',_i,"%",_text],'data\images\tags\flag',true]call tag_notify;
		uiSleep 0.3;
		if(!alive player)exitWith {};
	};

    capturing = false;
    if (getPosASL player distance _lockpos > 1 || _capCancelled) exitWith {
		[_zone, _oldColor] call zone_setCapping;
        hint 'Flag Capture Interrupted';
    };
	if (_curOwner != "") exitWith {
		[_zone, "", _zonePole, _zoneFlag] call zone_setOwner;
		["ALL",[_zone],{systemchat format ["%1 has been neutralized!",(_this select 0)];},false,true]call network_MPExec;	
		
	};
    [_zone, (call gang_name), _zonePole, _zoneFlag] call zone_setOwner;
	["ALL",[(_zonePole call zone_name),(call gang_name)],{systemchat format ["%2 captured %1!",(_this select 0),_this select 1];},false,true]call network_MPExec;
