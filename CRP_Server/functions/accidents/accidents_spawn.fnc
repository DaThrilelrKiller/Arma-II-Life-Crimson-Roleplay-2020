private ["_marker","_location","_object","_markers","_wreck2","_wreck3","_wreck4","_wreck5","_wreck1","_vehicles"];

if ([]call ems_activeMission)exitWith {};

_location = call s_accidents_location;

["ALL",[],{
if (dtk_ems) then 
{
	playsound "bells"; 
	player sidechat "You are getting reports of a multiple car accident blocking a road!";
	player sidechat "Check your map for the location and get to it quickly!";
};
if (dtk_cop) then 
{
	playsound "beepsimple";
	player sidechat "Dispatch: Reports of a 10-50, all available units respond. Check your map for the location.";
};

},false,false]call network_MPExec;


_markers = ["CAR ACCIDENT!!",80,"ColorOrange",_location]call ems_createMarker;

_object = createVehicle ["HeliHEmpty", [0,0,0], [],0, "CAN_COLLIDE"];
_wreck1 = "LADAWreck" createvehicle _location;
_wreck2 = "SKODAWreck" createvehicle [0,0,0];
_wreck3 = "datsun02Wreck" createvehicle [0,0,0];
_wreck4 = "UralWreck" createvehicle [0,0,0];
_wreck5 = "UAZWreck" createvehicle [0,0,0];

_object setVehicleInit format["i=[this,4,%1] spawn core_burn",_wreck1]; processInitCommands;


_wreck2 setPos (_wreck1 modelToWorld [4.5,4.5,0]);
_pos = getPos _wreck2;
_wreck2 setPos [_pos select 0,_pos select 1,0];
_wreck3 setPos (_wreck1 modelToWorld [-4.5,-6,0]);
_pos = getPos _wreck3;
_wreck3 setPos [_pos select 0,_pos select 1,0];
_wreck4 setPos (_wreck1 modelToWorld [0,10,0]);
_pos = getPos _wreck4;
_wreck4 setPos [_pos select 0,_pos select 1,0];
_wreck5 setPos (_wreck1 modelToWorld [4.5,-6.5,0]);
_pos = getPos _wreck5;
_wreck5 setPos [_pos select 0,_pos select 1,0];

_wreck2 setDir 134;
_wreck3 setDir 83;
_wreck4 setDir 270;
_wreck5 setDir 24;

_wreck1 call core_setVarName;
_wreck2 call core_setVarName;
_wreck3 call core_setVarName;
_wreck4 call core_setVarName;
_wreck5 call core_setVarName;

_vehicles = [_wreck1,_wreck2,_wreck3,_wreck4,_wreck5,_object];

["ALL",[_wreck1,['','noscript.sqf',format["[%1,%2] spawn accidents_clear",_vehicles,_markers],25,false,true,'LeanRight','player distance _target < 5 && {!([_target,"Clean up accident(E)","data\images\tags\jaws"]call tag_show)}']],"network_addAction",false,false]call network_MPExec;
["ALL",[_wreck2,['','noscript.sqf',format["[%1,%2] spawn accidents_clear",_vehicles,_markers],25,false,true,'LeanRight','player distance _target < 5 && {!([_target,"Clean up accident(E)","data\images\tags\jaws"]call tag_show)}']],"network_addAction",false,false]call network_MPExec;
["ALL",[_wreck3,['','noscript.sqf',format["[%1,%2] spawn accidents_clear",_vehicles,_markers],25,false,true,'LeanRight','player distance _target < 5 && {!([_target,"Clean up accident(E)","data\images\tags\jaws"]call tag_show)}']],"network_addAction",false,false]call network_MPExec;
["ALL",[_wreck4,['','noscript.sqf',format["[%1,%2] spawn accidents_clear",_vehicles,_markers],25,false,true,'LeanRight','player distance _target < 5 && {!([_target,"Clean up accident(E)","data\images\tags\jaws"]call tag_show)}']],"network_addAction",false,false]call network_MPExec;
["ALL",[_wreck5,['','noscript.sqf',format["[%1,%2] spawn accidents_clear",_vehicles,_markers],25,false,true,'LeanRight','player distance _target < 5 && {!([_target,"Clean up accident(E)","data\images\tags\jaws"]call tag_show)}']],"network_addAction",false,false]call network_MPExec;


while {!isNull _object} do
{
	_randomtime = random (45) + 30;
	sleep _randomtime;
	_exp = "HelicopterExploBig" createVehicle (getPos _object);
};