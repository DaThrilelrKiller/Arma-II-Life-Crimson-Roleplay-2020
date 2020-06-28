private ["_plant","_pos","_object"];

_plant = _this select 0;
_pos = getPosASL _plant;

if (surfaceisWater _pos)exitWith {};

_object = createVehicle ["HeliHEmpty", [0,0,0], [],0, "CAN_COLLIDE"];
_object setPosASL _pos;
_object setVehicleInit "[this,4,this] spawn core_burn;"; 
processInitCommands;

_plant setDamage 1;

{	
	sleep (random (40)) + dtk_SpreadSpeed;
	
	if (isNull _object)exitWith {};
	if (damage _object > 0.5)exitWith {};
	
	if (typeOf _x == "" && {damage _x != 1})then
	{
		[_x]spawn s_ems_burnPlant;
	};
	
}forEach (nearestObjects [[_pos select 0,_pos select 1],[],10]);