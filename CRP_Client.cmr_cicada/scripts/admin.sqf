
DEV_PreviePos = [50,50,50];
DEV_RefreshThread = []spawn {};

DEV_Classes = [
"CfgVehicles",
"CfgSounds",
"CfgWeapons",
"CfgMagazines"
];

DEV_CfgVehicles = [
	"All",
	"AllVehicles",
	"LandVehicle",
	"Land",
	"Air",
	"Truck",
	"Ship",
	"Car",
	"Tank",
	"Helicopter",
	"Plane",
	"Man",
	"Thing",
	"Building",
	"House",
	"Man",
	"Motorcycle"
];

DEV_CfgSounds = [
	"All"
];

DEV_CfgWeapons = [
	"All",
	"CannonCore",
	"RifleCore",
	"Rifle",
	"Launcher",
	"Default",
	"Pistol"
];

DEV_CfgMagazines = [
	"All",
	"Current Weapon"
];

DEV_CfgVehicles_Actions = [
	[{_this call DEV_PreviewVehicle;},"Preview"],
	[{_this call DEV_CreateVehicle;},"Create"],
	[{_this call DEV_LogName;},"Log Classname"],
	[{_this call DEV_LogTemplate;},"Log Template"]
];

DEV_LogTemplate = {
	private ["_name","_configEntry"];
	_name = lbText [1501, (lbCurSel 1501)];
	_configEntry = lbText [2100, (lbCurSel 2100)];
	
	if (_configEntry == "CfgVehicles")then {
		diag_log formatText ['["%1",["vehicle","car"],["%1","%2"],[100000,100000],[1,"DTK_License_civ_drivers","",150],[]],',(_this select 0),_name];
	};
	if (_configEntry == "CfgWeapons")then {
		diag_log formatText ['["%1",["weapon","pistol"],["%1","%2"],[100000,100000],[1,"",""],[]],',(_this select 0),_name];
	};
	if (_configEntry == "CfgMagazines")then {
		diag_log formatText ['["%1",["magazin",""],["%1","%2"],[100000,100000],[1,"",""],[]],',(_this select 0),_name];
	};
	systemchat format ["DevCon: Template logged for: %1",_name];
};

DEV_PreviewVehicle = {

	deleteVehicle DTK_Veh;
	
	DTK_Veh = (_this select 0) CreateVehicleLocal  [0,0,0];
	DTK_Veh enableSimulation false;
	DTK_Veh setPos DEV_PreviePos;
	DTK_Veh setVariable ['DTK_OwnerUID',[[getPlayerUID player],name player,'',name player], true];
	DTK_Veh setVariable ['dtk_keys',[getPlayerUID player], true];
	DTK_Veh setVariable ['dtk_storage',[[],[]], true];
	
	(_this select 0) call DEV_CreateCam;
};

DEV_PreviewWeapon = {
	
	deleteVehicle DTK_Veh;
	deleteVehicle DEV_WeaponHolder;
	DEV_WeaponHolder = "WeaponHolder" CreateVehicleLocal  [0,0,0];
	DEV_WeaponHolder setPos DEV_PreviePos;
	DEV_WeaponHolder addWeaponCargo [_this select 0,1];
	
	"WeaponHolder" call DEV_CreateCam;
};

DEV_PreviewMagazine = {
	
	deleteVehicle DTK_Veh;
	deleteVehicle DEV_WeaponHolder;
	DEV_WeaponHolder = "WeaponHolder" CreateVehicleLocal  [0,0,0];
	DEV_WeaponHolder setPos DEV_PreviePos;
	DEV_WeaponHolder addMagazineCargo [_this select 0,1];
	
	"WeaponHolder" call DEV_CreateCam;
};

DEV_CreateCam = {
	
	if (isNil "DEV_Cam" || {isNull DEV_Cam})then {
		DEV_Cam = "Camera" camCreate [0, 0, 0];
		DEV_Cam cameraEffect ["internal", "front"];
		DEV_Cam camSetTarget [DEV_PreviePos select 0,(DEV_PreviePos select 1),DEV_PreviePos select 2];
	};
	
	if (_this != "WeaponHolder")then {
		_zoom = sizeOf  _this;
		if (_zoom != 0)then {
			DEV_Cam camSetRelPos [_zoom, _zoom, _zoom/2];
		};

	}else{
		DEV_Cam camSetRelPos [1, 1,2];
	};
	
	DEV_Cam camCommit 0;
	
	[]call DEV_CamHandler;

};

DEV_CamHandler = {
	if (isNil "DEV_H_Cam" || {ScriptDone DEV_H_Cam})then {
		DEV_H_Cam = []spawn {
			waitUntil {!dialog};
			DEV_Cam cameraEffect ['terminate','back'];
			deleteVehicle DEV_Cam;
		};
	};
};


DEV_CfgWeapons_Actions = [
	[{_this call DEV_PreviewWeapon;},"Preview"],
	[{_this call DEV_AddWeapon;},"Create"],
	[{_this call DEV_LogName;},"Log Classname"],
	[{_this call DEV_LogTemplate;},"Log Template"]
];

DEV_CfgMagazines_Actions = [
	[{_this call DEV_PreviewMagazine;},"Preview"],
	[{_this call DEV_AddMagazine;},"Create"],
	[{_this call DEV_LogName;},"Log Classname"],
	[{_this call DEV_LogTemplate;},"Log Template"]
];
DEV_CfgSounds_Actions = [
	[{(_this select 0) say (_this select 1);},"Preview"],
	[{_this call DEV_LogName;},"Log Classname"]
];

DEV_Open = {
	if !(SwagDevs) exitWith {true};

	closeDialog 0;
	if (!scriptDone DEV_RefreshThread)then {
		terminate DEV_RefreshThread;
	};

	createDialog "DevCon";
	{
		lbAdd [2100,_x];
	}forEach DEV_Classes;
	
	lbSetCurSel [2100, 0];
	[]call DEV_PlayerList;
};

DEV_RefreshKind = {
	lbClear 2101;

	{
		lbAdd [2101,_x];
	}forEach (missionNameSpace getVariable [format["DEV_%1",lbText [2100, (lbCurSel 2100)]],[]]);
	lbSetCurSel [2101, 0];
};

DEV_GetKind = {
	private ["_weapon","_kind","_type","_return"];

	_type = _this select 0;
	_kind = _this select 1;

	if (_type isKindOf _kind)exitWith {true};

	_unknownConfig = configFile >> lbText [2100, (lbCurSel 2100)] >> _type;
	_pistolConfig = configFile >> lbText [2100, (lbCurSel 2100)] >> _kind;
		
	_return = false;
	while {isClass _unknownConfig} do
	{
		if (_unknownConfig == _pistolConfig) exitWith
		{
			_return = true; 
		};
		 _unknownConfig = inheritsFrom _unknownConfig;
	};
	_return;
};

DEV_GetPicture = {
	private ["_picture","_array"];

	_picture = getText(_this >> "picture");
	_array = [_picture,"."]call string_split;
	
	_picture = if (count _array == 2)then {_picture}else{getText(configFile >> "CfgVehicleIcons" >> _picture)};
	_picture
};


DEV_LoadMagazinesCurrent = {
	private ["_magazines","_class","_name","_kind","_display","_picture"];

	_magazines = getArray(configFile >> "CfgWeapons" >> currentWeapon player >> "magazines");
	
	{
		_class = configFile >> "CfgMagazines" >> _x;
		if (isClass _class)then {
			_name = configName(_class);	
			
			if !(_name call TFAR_fnc_isRadio)then {
				_kind  = lbText [2101, (lbCurSel 2101)];
				
					
				_display = getText(_class >> "displayName");
				_display = if (_display == "")then {_name}else{_display};
				_picture = _class call DEV_GetPicture;
								
				_index = lbAdd [1501,format ["%2",_name,_display]];
				lbSetPicture [1501, _index, format ["%1",_picture]];
				lbSetData [1501, _index, _name];
			};
		};
	}forEach _magazines;
};

DEV_RefreshConfig = {
	
	if (!ScriptDone DEV_RefreshThread)then {
		terminate DEV_RefreshThread;
		waitUntil {scriptDone DEV_RefreshThread};
	};

	DEV_RefreshThread = _this spawn {
		private ["_config","_class","_type","_configEntry"];
		
		lbClear 1501;
		_configEntry = lbText [2100, (lbCurSel 2100)];
		_kind  = lbText [2101, (lbCurSel 2101)];
		
		_config = configFile >> _configEntry;
		
		if (_kind == "Current Weapon")exitWith {
			[]call DEV_LoadMagazinesCurrent;
		};
			
		for "_i" from 0 to (count _config)-1 do {
			_class = _config select _i;
			_name = configName(_class);	
			
			if ([_name,_kind] call DEV_GetKind || {_kind == "All"})then {
				
				_display = getText(_class >> "displayName");
				_display = if (_display == "")then {_name}else{_display};
				_picture = _class call DEV_GetPicture;
							
				_index = lbAdd [1501,format ["%2",_name,_display]];
				lbSetPicture [1501, _index, format ["%1",_picture]];
				lbSetData [1501, _index, _name];
				

				if (isNil format['%1',_name])then {
					lbSetColor [1501,_index,[0,1,0,1]];
				};
				
			};
		};
	};
};

DEV_RefreshActions = {
	lbClear 1502;
	
	{
		 lbAdd [1502,_x select 1];
	}forEach (missionNameSpace getVariable [format["DEV_%1_Actions",lbText [2100, (lbCurSel 2100)]],[]]);
	lbSetCurSel [1502, 0];
};

DEV_AddMagazine = {
	_magazine = _this select 0;
	player addMagazine _magazine;
	systemchat format ["You have added 1 %1 to you inventoy",lbText [1501,(lbCurSel 1501)]];
};

DEV_AddWeapon = {
	_weapon = _this select 0;
	_weaponCfg = (configFile >> "cfgWeapons" >> _weapon);
	_type = getNumber(_weaponCfg >> "type");
	if (_type in [1,2,4,5]) then {
		{_cWepType = [getNumber(configFile >> "cfgWeapons" >> _x >> "type")];
		if (_cWepType select 0 in [1,5]) then {_cWepType = [1,5];};
		if (_type in _cWepType) then {
			player removeWeapon _x;
			_current_magazines = magazines player;
			_compatible_magazines = getArray(configFile >> "cfgWeapons" >> _x >> "magazines");
			{if (_x in _compatible_magazines) then {
				player removeMagazine _x;
			};} forEach _current_magazines;
		};} forEach (weapons player);
	};
	_magazines = [];
	{
		_magazines = _magazines + getArray( (if ( _x == "this" ) then { _weaponCfg } else { _weaponCfg >> _x }) >> "magazines")
	} forEach getArray(_weaponCfg >> "muzzles");
	if (count(_magazines) > 0) then {
		player addMagazine (_magazines select 0);
	};
	player addWeapon _weapon;
	player selectWeapon _weapon;
	
	_compatible_magazines = [];
	{
		_compatible_magazines = _compatible_magazines + getArray(configFile >> "cfgWeapons" >> _x >> "magazines");
	} forEach (weapons player);
	{if !(_x in _compatible_magazines) then {
		player removeMagazine _x;
	};} forEach (magazines player);
	closeDialog 0;
};

DEV_CreateVehicle = {
	_dir = getdir player;
	_pos = getPos player;
	_pos = [(_pos select 0)+20*sin(_dir),(_pos select 1)+20*cos(_dir),0];
	_classname = _this select 0;
	_unit = _this select 1;
	
	if (_classname isKindOf "Man")exitWith {
		[_classname] call clothing_switch;
		CloseDialog 0;	
	};

	if (isNull (driver DTK_Vehicle))then {
		deleteVehicle DTK_Vehicle;
	};

	DTK_Vehicle =  createVehicle [_classname,_pos, [], 0, "CAN_COLLIDE"];
	DTK_Vehicle setVehicleInit format [
	"
		this setVehicleVarName ""vehicle_%2_%1"";
		vehicle_%2_%1 = this; 
		clearWeaponCargo this; 
		clearMagazineCargo this;
		this lock true;
		[this]call mounted_add_actions;
	"
	, round(random 10), round(time)];
	processInitCommands;
	
	DTK_Vehicle setDir _dir;
	_data = [[getPlayerUID (_this select 1)],_classname,dtk_side,name player];
	DTK_Vehicle setVariable ["DTK_OwnerUID",_data, true];
	DTK_Vehicle setVariable ["dtk_keys",[getPlayerUID player], true];
	DTK_Vehicle setVariable ["dtk_storage",[[],[]], true];
	DTK_Vehicle setvariable ["tuning",1.008, true];
	DTK_Vehicle addeventhandler ["HandleDamage",'_this call vehicle_handleDamage' ];	
	["ALL",[DTK_Vehicle,['','noscript.sqf',format["[%1]call vehicle_getIn;",DTK_Vehicle],-1,false,true,'LeanRight','vehicle player == _target']],"network_addAction",false,true]call network_MPExec;
	["ALL",[DTK_Vehicle,['','noscript.sqf',format["[%1]call vehicle_getIn;",DTK_Vehicle],-1,false,true,'LeanRight','player distance _target < 5 && {(_target call vehicle_side) == dtk_side or dtk_side == "CIV"} && {vehicle player == player} && {!(locked _target)} && {!([_target,"Get In (E)",""]call tag_show)}']],"network_addAction",false,true]call network_MPExec;
	["ALL",[DTK_Vehicle,['','noscript.sqf',format["[%1]call vehicle_menu;",DTK_Vehicle],-1,false,true,'LeanRight','player distance _target < 5 && {(_target call vehicle_side) != dtk_side} && {vehicle player == player} && {dtk_side == "PD"} && {!([_target,"Vehicle Menu (E)",""]call tag_show)}']],"network_addAction",false,true]call network_MPExec;
	["ALL",[DTK_Vehicle,["Roll Vehicle Over","noscript.sqf",'[]spawn vehicle_unflip;',1,false,true,"",'player distance _target < 5 && {[_target,["Air", "Ship", "LandVehicle"]]call core_isKindOf}']],"network_addAction",false,true]call network_MPExec;
	["ALL",[DTK_Vehicle,["Pull Player Out","noscript.sqf",'(_this select 0) spawn Other_pullout;',1,true,true,"",'[_target,["Air", "Ship", "LandVehicle"]]call core_isKindOf && {player distance _target < 5} && {count (crew _target) > 0} && {(call INV_isArmed)}']],"network_addAction",false,true]call network_MPExec;

	[DTK_Vehicle] call plates_setplate;
	
	if (dtk_cop || {dtk_ems}) then {
		if !(_classname isKindOf "Air")then 
		{
			DTK_Vehicle setVariable ["dtk_sirens",["dtk_HighWail","dtk_Yelp","dtk_LowPhasser"],true];
		};
	};

	if (_classname in dtk_towers)then {
		DTK_Vehicle setVariable["towing","",true];
	};				

	[_classname,DTK_Vehicle]call vehicle_texture;														
	player reveal DTK_Vehicle;
	deleteVehicle DTK_Veh;
	
	CloseDialog 0;	
};

DEV_LogName = {
	diag_log formatText ["[LOG] %2 - %1",_this select 0,lbText [1501,(lbCurSel 1501)]];
};

DEV_ExecAction = {
	_unit = missionNameSpace getVariable (lbData [2102, (lbCurSel 2102)]);
	_selected = lbData [1501, (lbCurSel 1501)];
	_function = (missionNameSpace getVariable [format["DEV_%1_Actions",lbText [2100, (lbCurSel 2100)]],[]]) select (lbCurSel 1502) select 0;
	[_selected,_unit]call _function;
};

DEV_PlayerList = {
	{
		_index = lbAdd [2102,format ["%2-%1",name _x,_x]];
		lbSetData[_index,str _x];
	}forEach playableUnits;
	lbSetCurSel [2102, 0];
};

