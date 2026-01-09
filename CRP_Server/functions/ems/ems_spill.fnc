private ["_location","_object","_markers","_city"];

if ([]call ems_activeMission)exitWith {};
	
_location = []call s_accidents_location;

_markers = ["CHEMICAL SPILL!!",50,"ColorGreen",_location]call ems_createMarker;
	
_object = "cl_chemical_spill" createVehicle _location;
_object call core_setVarName;

_city = [getPos _object]call locations_nearest;
_city = if(_city == "")then {format[" Located near %1",mapGridPosition getPos _object]}else{format[" Located near %1",_city]};

["ALL",[_object,['','noscript.sqf',format["[%1,%2]spawn spill_fix",_object,_markers],25,false,true,'LeanRight',format ['dtk_ems && {player distance _target < 8} && {!([_target,"Clean up chemical spill(E)","data\images\tags\spill"]call tag_show)}',_name13,_image]]],"network_addAction",false,true]call network_MPExec;
["ALL",["dtk_ems",format["A chemical spill has occured.%1",_city],3],"network_chat",false,false]call network_MPExec;