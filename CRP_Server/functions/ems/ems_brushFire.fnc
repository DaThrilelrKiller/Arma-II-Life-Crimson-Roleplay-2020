private ["_woods","_location","_markers","_message"];

_woods = nearestLocations [dtk_center, ["VegetationFir"],dtk_center select 0];
_location = _woods call bis_selectRandom;
_location = locationPosition _location;

if ([]call ems_activeMission)exitWith {};

_markers = ["Bush Fire!!",80,"ColorYellow",_location]call ems_createMarker;

["ALL",["dtk_ems","911: Reports of multiple calls for a Brush Fire! Check your Map",3],"network_chat",false,false]call network_MPExec;

dtk_SpreadSpeed = round (random 5) + 1;

if (dtk_SpreadSpeed < 3)then {
	_message = format ["911: All available units requested to respond to: [] for a fast moving brush fire! ",_location];
	["ALL",["dtk_ems",_message,3],"network_chat",false,false]call network_MPExec;
};

{   
	if (typeOf _x == "") exitWith     
	{ 
		[_x]spawn s_ems_burnPlant;
	};
}foreach (nearestObjects [[_location select 0,_location select 1],[],10]);