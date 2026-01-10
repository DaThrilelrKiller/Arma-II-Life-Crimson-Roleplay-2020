private ["_towns","_vehTypes","_name","_unitType","_side","_unit","_town","_pos","_roads","_grp","_veh","_road","_return"];

if (!isServer) exitWith {};

_side = civilian;
_unitType = ["Functionary1","RU_SchoolTeacher","CIV_EuroMan02_EP1","Citizen1","Dr_Hladik_EP1","Villager2"];
_vehTypes = [ 	"MMT_Civ", 	"Old_moto_TK_Civ_EP1", 	"TT650_TK_CIV_EP1", 	"TT650_Civ", 	"TT650_Ins", 	"M1030", 	"ATV_CZ_EP1", 	"Skoda", 	"SkodaBlue", 	"SkodaRed", 	"SkodaGreen", 	"Volha_1_TK_CIV_EP1", 	"Volha_2_TK_CIV_EP1", 	"VolhaLimo_TK_CIV_EP1", 	"Lada1_TK_CIV_EP1", 	"Lada2_TK_CIV_EP1", 	"VWGolf", 	"car_hatchback", 	"Car_Sedan", 	"Lada1", 	"Lada2", 	"S1203_TK_CIV_EP1", 	"LandRover_TK_CIV_EP1", 	"LandRover_CZ_EP1", 	"hilux1_civil_1_open", 	"hilux1_civil_2_covered", 	"hilux1_civil_3_open_EP1", 	"hilux1_civil_3_open", 	"datsun1_civil_1_open", 	"datsun1_civil_2_covered", 	"datsun1_civil_3_open" 	];

_towns = nearestLocations [dtk_center, ["NameCity","NameCityCapital","NameVillage"], (dtk_center select 0)];		
_town = _towns call BIS_selectRandom;
_pos = locationPosition _town;
_roads = _pos nearRoads 500;

if (count _roads > 0) then {

	_road = _roads call BIS_selectRandom;

	_grp = createGroup _side;

	_unit = _grp createUnit [_unitType call BIS_selectRandom, [random 10,random 10,0], [], 0, "NONE"];
	
	[_unit]call s_civilians_setLoadout;
	
	_preferredVehicle = _unit getVariable ["dtk_loadout_vehicle", ""];
	_vehicleType = if (_preferredVehicle != "") then {_preferredVehicle} else {_vehTypes call BIS_selectRandom};
	
	_veh = createVehicle [_vehicleType, position _road, [], 0, "NONE"];
	[_grp,_veh]call groups_addVeh;
	
	_veh setVehicleInit format [
		"
			this setVehicleVarName ""vehicle_%2_%1"";
			vehicle_%2_%1 = this; 
			clearWeaponCargo this; 
			clearMagazineCargo this;
			this lock true;
			[this]call mounted_add_actions;
		"
		, round(random 100), round(time)];
		processInitCommands;

	_veh setVariable ["DTK_OwnerUID",[["Server"],"","CIV",name _unit], true];
	_veh setVariable ["dtk_keys",[getPlayerUID player], true];
	_veh setVariable ["dtk_storage",[[],[]], true];
	[_veh] call plates_setplate;
	_veh addeventhandler ["HandleDamage",'_this call vehicle_handleDamage' ];	
	["ALL",[_veh,['','noscript.sqf',format["[%1]call vehicle_getIn;",_veh],-1,false,true,'LeanRight','vehicle player == _target']],"network_addAction",false,true]call network_MPExec;
	["ALL",[_veh,['','noscript.sqf',format["[%1]call vehicle_getIn;",_veh],-1,false,true,'LeanRight','player distance _target < 5 && {(_target call vehicle_side) == dtk_side or dtk_side == "CIV"} && {vehicle player == player} && {!(locked _target)} && {!([_target,"Get In (E)",""]call tag_show)}']],"network_addAction",false,true]call network_MPExec;
	["ALL",[_veh,['','noscript.sqf',format["[%1]call vehicle_menu;",_veh],-1,false,true,'LeanRight','player distance _target < 5 && {(locked _target)} && {vehicle player == player} && {dtk_side == "PD"} && {!([_target,"Vehicle Menu (E)",""]call tag_show)}']],"network_addAction",false,true]call network_MPExec;
	["ALL",[_veh,"ems_SwitchGear",_veh],"network_syncJip",false,true]call network_MPExec;
	_veh lock true;



		
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

	_unit moveInDriver _veh;

	_grp setBehaviour "SAFE";
	_grp setSpeedMode "FULL";
	_grp setCombatMode "BLUE";

	_veh forceSpeed 60;
	_veh setFuel 1;
	_return = [_veh,_unit];

};

_return
