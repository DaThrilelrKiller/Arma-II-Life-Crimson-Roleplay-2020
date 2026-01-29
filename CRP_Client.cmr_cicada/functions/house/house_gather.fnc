
if !(dtk_civ)exitWith {};

{	
	_marker =  format["house_%1",_ForEachINdex];
	_text = markerText _marker;
	if (_text == format ["%1's House",name player])then {
		_name = format["House #%1",_ForEachINdex];
		_index = lbAdd [1401, _name];
		_building  = nearestBuilding (getMarkerPos _marker);
		lbSetData [1401, _index,str((_building call core_buildingPostions)call bis_selectRandom)];
	};
}forEAch dtk_house_list;