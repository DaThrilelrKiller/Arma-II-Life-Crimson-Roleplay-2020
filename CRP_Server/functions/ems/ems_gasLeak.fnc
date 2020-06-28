private ["_location","_mrkarea","_text","_object","_city","_markers"];

if ([]call ems_activeMission)exitWith {};

_location = call s_ems_getArea;

_markers = ["GAS LEAK!!",80,"ColorYellow",_location]call ems_createMarker;

_object = createVehicle ["cl_oxygen", _location, [], 0, "CAN_COLLIDE"];
_object call core_setVarName;

_object setPos _location;
_object setVehicleInit "this enableSimulation false";
processInitCommands;

["ALL",[_object,['','noscript.sqf',format["[%1,%2]spawn gas_fix",_object,_markers],25,false,true,'LeanRight',format ['dtk_ems && {player distance _target < 5} && {!([_target,"Clean up accident(E)","\crp_data\images\items\gasmask"]call tag_show)}',_name13,_image]]],"network_addAction",false,true]call network_MPExec;


_city = [_location]call locations_nearest;
_city = if(_city == "")then {format[" Located near %1",mapGridPosition _location]}else{format[" Located near %1",_city]};

["ALL",["dtk_ems",format["911:Reciving calls for a gas leak.%1",_city],3],"network_chat",false,false]call network_MPExec;


while {!isNull _object} do
{
	"SmokeShellYellow" createVehicle _location;
	sleep 25;
};