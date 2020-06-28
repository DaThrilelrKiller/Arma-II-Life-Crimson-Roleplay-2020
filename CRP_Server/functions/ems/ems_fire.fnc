private ["_building","_markers","_name","_city","_FirePostions"];

if ([]call ems_activeMission)exitWith {};

if (typename _this == "OBJECT")then {
	_building = _this;
}else{
	_building = []call s_ems_getBuilding;
};
_FirePostions = _building call core_buildingPostions;
_markers = ["FIRE!!",80,"ColorYellow",getPos _building]call ems_createMarker;
_name = _building call core_getName;
_city = [getPos _building]call locations_nearest;
_city = if(_city == "")then {format[" Located near %1",mapGridPosition getPos _building]}else{format[" Located near %1",_city]};

[0,_FirePostions,_building] spawn s_ems_buildingFire;

["ALL",["dtk_ems",format["911: Reports of multiple call for a %1 fire.%2",_name,_city],3],"network_chat",false,false]call network_MPExec;