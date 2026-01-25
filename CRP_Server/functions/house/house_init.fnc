[]call s_house_makeList;

{
	_type = typeOf _x;
	_name = gettext(configFile >> "CfgVehicles" >> _type >> "Displayname");
	
	_marker = createMarker [format["house_%1",_ForEachINdex],getPos _x];
	_marker setMarkerType "mil_box";
	
	_owner = ["Houses",_marker, "Owner",""]call s_stats_read;
	
	if (_owner != "")then {
		_name = ["Houses",_marker, "Name",""]call s_stats_read;
		_marker setMarkerText format ["%1's House",_name];
	};
	
	_marker setMarkerAlpha 1;
	
	dtk_houses set [count dtk_houses,_marker];
	
}forEAch dtk_house_list;
