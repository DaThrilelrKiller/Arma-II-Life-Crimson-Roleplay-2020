private ["_towns","_vehTypes","_name","_unitType","_side","_unit","_town","_pos","_roads","_grp","_veh","_road","_return"];

if (!isServer) exitWith {};

_side = civilian;
_unitType = ["Functionary1","RU_SchoolTeacher","CIV_EuroMan02_EP1","Citizen1","Dr_Hladik_EP1","Villager2"];
_vehTypes = [ 	"MMT_Civ", 	"Old_moto_TK_Civ_EP1", 	"TT650_TK_CIV_EP1", 	"TT650_Civ", 	"TT650_Ins", 	"M1030", 	"ATV_CZ_EP1", 	"Skoda", 	"SkodaBlue", 	"SkodaRed", 	"SkodaGreen", 	"Volha_1_TK_CIV_EP1", 	"Volha_2_TK_CIV_EP1", 	"VolhaLimo_TK_CIV_EP1", 	"Lada1_TK_CIV_EP1", 	"Lada2_TK_CIV_EP1", 	"VWGolf", 	"car_hatchback", 	"Car_Sedan", 	"Lada1", 	"Lada2", 	"S1203_TK_CIV_EP1", 	"LandRover_TK_CIV_EP1", 	"LandRover_CZ_EP1", 	"hilux1_civil_1_open", 	"hilux1_civil_2_covered", 	"hilux1_civil_3_open_EP1", 	"hilux1_civil_3_open", 	"datsun1_civil_1_open", 	"datsun1_civil_2_covered", 	"datsun1_civil_3_open" 	];

_towns = nearestLocations [dtk_center, ["NameCity","NameCityCapital","NameVillage"], (dtk_center select 0)];		
if (count _towns == 0) exitWith {[]};
_town = _towns select floor (random (count _towns));
_pos = locationPosition _town;
_roads = _pos nearRoads 500;

if (count _roads > 0) then {

	_road = _roads select floor (random (count _roads));

	_grp = createGroup _side;

	_unit = _grp createUnit [_unitType select floor (random (count _unitType)), [random 10,random 10,0], [], 0, "NONE"];
	
	[_unit]call s_civilians_setLoadout;
	
	_preferredVehicle = _unit getVariable ["dtk_loadout_vehicle", ""];
	_vehicleType = if (_preferredVehicle != "") then {_preferredVehicle} else {_vehTypes select floor (random (count _vehTypes))};
	
	_veh = createVehicle [_vehicleType, position _road, [], 0, "NONE"];
	[_grp,_veh]call groups_addVeh;
	
	_veh setVehicleInit format [
		"
			this setVehicleVarName ""vehicle_%2_%1"";
			vehicle_%2_%1 = this; 
			clearWeaponCargo this; 
			clearMagazineCargo this;
			[this]call mounted_add_actions;
		"
		, round(random 100), round(time)];
		processInitCommands;

	_veh setVariable ["DTK_OwnerUID",[["Server"],"","CIV",name _unit], true];
	// Dedicated server has no `player` object; avoid getPlayerUID player which breaks civilian spawns.
	// Civ AI vehicles don't need player keys.
	_veh setVariable ["dtk_keys",[], true];
	_veh setVariable ["dtk_storage",[[],[]], true];
	[_veh] call plates_setplate;
	_veh addeventhandler ["HandleDamage",'_this call vehicle_handleDamage' ];	
	["ALL",[_veh,['','noscript.sqf',format["[%1]call vehicle_getIn;",_veh],-1,false,true,'LeanRight','vehicle player == _target']],"network_addAction",false,true]call network_MPExec;
	["ALL",[_veh,['','noscript.sqf',format["[%1]call vehicle_getIn;",_veh],-1,false,true,'LeanRight','player distance _target < 5 && {(_target call vehicle_side) == dtk_side or dtk_side == "CIV"} && {vehicle player == player} && {!(locked _target)} && {!([_target,"Get In (E)",""]call tag_show)}']],"network_addAction",false,true]call network_MPExec;
	["ALL",[_veh,['','noscript.sqf',format["[%1]call vehicle_menu;",_veh],-1,false,true,'LeanRight','player distance _target < 5 && {(locked _target)} && {vehicle player == player} && {dtk_side == "PD"} && {!([_target,"Vehicle Menu (E)",""]call tag_show)}']],"network_addAction",false,true]call network_MPExec;
	["ALL",[_veh,"ems_SwitchGear",_veh],"network_syncJip",false,true]call network_MPExec;
	// IMPORTANT: don't lock until the AI driver is seated, otherwise cars can spawn empty.
	_veh lock false;



		
	if (random 1 < 0.5) then {
		_veh setDir getDir _road;
		} else {
		_veh setDir (getDir _road + 180) % 360;
	};
	
	_name = format["civ_%1_%2",round(random 500), round(time)];


	_unit setVehicleInit format [
		"
			this setVehicleVarName ""%1"";
			%1 = this;
			this addaction ['','noscript.sqf',format['%1 call core_interact;',this],25,false,true,'LeanRight',format['player distance _target < 5 && {!([_target,''Interact (E)'',tag_default]call tag_show)}',this getVariable ['dtk_tag',tag_default]]];
		"
		, _name];
	processInitCommands;
	
	_unit addMPEventHandler ["MPKilled",{_this call killfeed_display;}];
	_unit addEventHandler ["Killed", { [(_this select 0),(_this select 0)] call storage_dropall;}];
	
	/* Initialize surrender system */
	_unit setVariable ["dtk_surrendered", false, true];
	_unit setVariable ["dtk_surrender_state", "normal", true];
	_unit setVariable ["dtk_threatGoneTime", 0, true];
	_unit setVariable ["dtk_lastShotNear", 0, true];
	_unit addEventHandler ["FiredNear", {
		private ["_unit", "_shooter", "_distance"];
		_unit = _this select 0;
		_shooter = _this select 1;
		_distance = _this select 2;
		
		[civ47,["true",format ["FiredNear Event: Unit %1 - Shooter: %2, Distance: %3m, DTK_CIV_SURRENDER_SHOT_RADIUS: %4m, alive: %5", name _unit, name _shooter, _distance, DTK_CIV_SURRENDER_SHOT_RADIUS, alive _unit],3],"network_chat",false,false] call network_MPExec;
		
		if (alive _unit  && {_distance <= DTK_CIV_SURRENDER_SHOT_RADIUS}) then {
			_unit setVariable ["dtk_lastShotNear", time, true];
			[civ47,["true",format ["FiredNear Event: Unit %1 - Shot detected! Set dtk_lastShotNear to %2", name _unit, time],3],"network_chat",false,false] call network_MPExec;
		} else {
			[civ47,["true",format ["FiredNear Event: Unit %1 - Shot NOT in range or unit dead (distance: %2 > %3 or alive: %4)", name _unit, _distance, DTK_CIV_SURRENDER_SHOT_RADIUS, alive _unit],3],"network_chat",false,false] call network_MPExec;
		};
	}];

	_unit assignAsDriver _veh;
	_unit moveInDriver _veh;
	_veh lock true;

	_grp setBehaviour "CARELESS";
	_grp setSpeedMode "FULL";
	_grp setCombatMode "BLUE";

	_veh forceSpeed 60;
	_veh setFuel 1;
	_return = [_veh,_unit];

};

_return
