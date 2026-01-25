private ["_unit","_weapon","_object","_damage","_markers"];

_unit = _this select 0;
_weapon = _this select 1;

if (_weapon == "FirefighterWeap2") then
{
	_object = nearestObjects [player, ["Misc_TyreHeap","Land_Campfire","Land_Campfire_burning"],5];
	_particle = nearestObject [getPos player,"#particlesource"];
	
	if !(isNull _particle)then {
		_object = _object + [_particle];
	};
	
	if (count _object == 0)exitWith {};
	_object = _object select 0;
	
	if (inflamed _object && {(["Misc_TyreHeap","Land_Campfire","Land_Campfire_burning"] find (typeOf _object)) > -1})exitWith {
		_object inFlame false;
	};
	
	if ((["#particlesource"] find (typeOf _object)) > -1)exitWith {
		_object setDamage (damage _object + random 0.015);
		_damage = 100 - (round ((damage _object)*100));
		[format['%1%2 of the fire contained',_damage,"%"],'data\images\tags\fire',true]call tag_notify;
		if !(damage _object < 1)then
		{
			deleteVehicle _object;
			systemChat "You have put the fire out! Congrats my friend";
			deleteMarker "mrk_ems_1";
			deleteMarker "mrk_ems_1_area";
			[player,"geld", 8000] call storage_add;			
			systemChat "You Have Been Paid 8,000$ For Putting The Fire Out!";
		};
	};
};