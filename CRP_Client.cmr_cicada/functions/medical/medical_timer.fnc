private ["_unit","_corps","_time","_deathTime","_text","_marker"];
_unit = _this select 0;
_corps = _this select 1;
_deathTime = _this select 2;
_time = _deathTime call medical_getTime;

waitUntil {lifeState player == "UNCONSCIOUS"};

while {time < _time} do {
_time = _deathTime call medical_getTime;

	_text =  format["%1 Second(s) Untill Respawn",[(_time - time),"HH:MM:SS"]call BIS_fnc_timeToString ];
	titleText [_text, "PLAIN", 3];

	/* go ahead and exit the loop if they are revived */
	if (lifeState player != "UNCONSCIOUS")exitWith {
		titleText ["", "PLAIN", 3];
		disableUserInput false;
		/* scence the player was revived by a emt go ahead and delete the body */
		deleteVehicle _corps;
		call medical_terminate;
	};

sleep 1;
};

/* if their timer runs out go ahead and give the option to respawn or wait for a medic */
if (lifeState player == "UNCONSCIOUS")exitWith 
{
	_corps setPos getPos _unit;
	disableUserInput false;
	call spawn_openMenu;
	titleText ["", "PLAIN", 3];
	
	player call cdb_clear_warrants;
	if (playersNumber Resistance > 0)then {
		deleteMarker  ("medical_" + name player);
		deleteVehicle _corps;
	}else{
		deleteMarker  ("medical_" + name player);
		deleteVehicle _corps;
	};

	call medical_terminate;
}; 