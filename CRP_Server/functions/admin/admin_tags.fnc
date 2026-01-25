
if (dtk_adminTags)exitWith {
	dtk_adminTags = false;
};

dtk_adminTags = true;

setGroupIconsVisible [true,true];  

waitUntil {
	{
		clearGroupIcons group _x; 
		_name = name _x;
	
		group _x addGroupIcon ["x_art", [0,0]];
		group _x setGroupIconParams [[1, 0, 0, 1],format ["%1 - %2m",_name, ceil (_x distance player)],0.5,true];
	}forEach playAbleunits;
	
	{
		if (vehicleVarName _x != "" && {!(_x in INV_ServerBuildingArray)})then {
			
			private ["_marker","_pos","_created","_name"];
			_marker = format["adTag_%1",_x];
			_pos = getPos _x;
			_created = (str (getMarkerPos _marker) != "[0,0,0]");
			_name = getText(configFile >> "CfgVehicles" >> typeOf _x >> "DisplayName");
			_driver = name (driver _x);
			_driver = if (_driver == "Error: No vehicle")then{""}else{_driver};
		
			if !(_created)then {
				_marker = createMarkerLocal [_marker, [_pos select 0, _pos select 1]];
				_marker setMarkerTypeLocal "waypoint";
				_marker setMarkerColorLocal "ColorRed";
				_marker setMarkerSizeLocal [0,0];
			};
				
			_marker setMarkerTextLocal format ["%1 %3 - %2m",_name, ceil (_x distance player),_driver];
			_marker setMarkerPosLocal ([_pos select 0, _pos select 1, 0]);
		};
	}forEach (Entities "LandVehicle"+ Entities "Air" + Entities"Ship");
	!dtk_adminTags
};

setGroupIconsVisible [false,false]; 