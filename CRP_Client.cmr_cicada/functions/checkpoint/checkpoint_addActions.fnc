private ["_object","_type","_actionText","_itemName","_script","_actionArray"];
_object = _this select 0;

if (isNil "_object" || {isNull _object}) exitWith {};

_type = typeOf _object;

// Map object types to their action text and item name
switch (_type) do {
	case "spikestrip": {
		_actionText = "Remove Spike Strip";
		_itemName = "spikestrip";
		_script = format ['if ([player,"%1",1] call storage_add)then {deletevehicle (_this select 0)}', _itemName];
		_actionArray = [_actionText,"noscript.sqf",_script,1,true,true,"",'player distance _target < 4'];
		["ALL",[_object,_actionArray],"network_addAction",false,true]call network_MPExec;
	};
	case "weaponholder": {
		_actionText = "Take Criminal Evidence";
		_script = '{deletevehicle _x} foreach (nearestobjects [getpos player, ["weaponholder"], 3])';
		_actionArray = [_actionText,"noscript.sqf",_script,1,true,true,"",'player distance _target < 4'];
		["ALL",[_object,_actionArray],"network_addAction",false,true]call network_MPExec;
	};
	case "glt_roadsign_octagon": {
		_actionText = "Remove Stop Sign";
		_itemName = "glt_roadsign_octagon";
		_script = format ['if ([player,"%1",1] call storage_add)then {deletevehicle (_this select 0)}', _itemName];
		_actionArray = [_actionText,"noscript.sqf",_script,1,true,true,"",'player distance _target < 4'];
		["ALL",[_object,_actionArray],"network_addAction",false,true]call network_MPExec;
	};
	case "il_barrier": {
		_actionText = "Remove Concrete Barrier Short";
		_itemName = "il_barrier";
		_script = format ['if ([player,"%1",1] call storage_add)then {deletevehicle (_this select 0)}', _itemName];
		_actionArray = [_actionText,"noscript.sqf",_script,1,true,true,"",'player distance _target < 4'];
		["ALL",[_object,_actionArray],"network_addAction",false,true]call network_MPExec;
	};
	case "SearchLight_UN_EP1": {
		_actionText = "Remove Searchlight";
		_itemName = "SearchLight_UN_EP1";
		_script = format ['if ([player,"%1",1] call storage_add)then {deletevehicle (_this select 0)}', _itemName];
		_actionArray = [_actionText,"noscript.sqf",_script,1,true,true,"",'player distance _target < 4'];
		["ALL",[_object,_actionArray],"network_addAction",false,true]call network_MPExec;
	};
	case "Land_CncBlock_Stripes": {
		_actionText = "Remove Roadblock";
		_itemName = "roadblock";
		_script = format ['if ([player,"%1",1] call storage_add)then {deletevehicle (_this select 0)}', _itemName];
		_actionArray = [_actionText,"noscript.sqf",_script,1,true,true,"",'player distance _target < 4'];
		["ALL",[_object,_actionArray],"network_addAction",false,true]call network_MPExec;
	};
	case "ZavoraAnim": {
		_actionText = "Remove Bar Gate";
		_itemName = "Bargate";
		_script = format ['if ([player,"%1",1] call storage_add)then {deletevehicle (_this select 0)}', _itemName];
		_actionArray = [_actionText,"noscript.sqf",_script,1,true,true,"",'player distance _target < 4'];
		["ALL",[_object,_actionArray],"network_addAction",false,true]call network_MPExec;
	};
	case "Land_coneLight": {
		_actionText = "Remove Road Cone";
		_itemName = "roadcone";
		_script = format ['if ([player,"%1",1] call storage_add)then {deletevehicle (_this select 0)}', _itemName];
		_actionArray = [_actionText,"noscript.sqf",_script,1,true,true,"",'player distance _target < 4'];
		["ALL",[_object,_actionArray],"network_addAction",false,true]call network_MPExec;
	};
	case "Land_fortified_nest_small": {
		_actionText = "Remove Bunker (small)";
		_itemName = "bunkersmall";
		_script = format ['if ([player,"%1",1] call storage_add)then {deletevehicle (_this select 0)}', _itemName];
		_actionArray = [_actionText,"noscript.sqf",_script,1,true,true,"",'player distance _target < 4'];
		["ALL",[_object,_actionArray],"network_addAction",false,true]call network_MPExec;
	};
	case "Sign_Danger": {
		_actionText = "Remove Danger Sign";
		_itemName = "danger";
		_script = format ['if ([player,"%1",1] call storage_add)then {deletevehicle (_this select 0)}', _itemName];
		_actionArray = [_actionText,"noscript.sqf",_script,1,true,true,"",'player distance _target < 4'];
		["ALL",[_object,_actionArray],"network_addAction",false,true]call network_MPExec;
	};
	case "land_ladder_half": {
		_actionText = "Remove Ladder";
		_itemName = "land_ladder_half";
		_script = format ['if ([player,"%1",1] call storage_add)then {deletevehicle (_this select 0)}', _itemName];
		_actionArray = [_actionText,"noscript.sqf",_script,1,true,true,"",'player distance _target < 4'];
		["ALL",[_object,_actionArray],"network_addAction",false,true]call network_MPExec;
	};
	case "RoadBarrier_long": {
		_actionText = "Remove Road Barrier";
		_itemName = "Roadbarrier_long";
		_script = format ['if ([player,"%1",1] call storage_add)then {deletevehicle (_this select 0)}', _itemName];
		_actionArray = [_actionText,"noscript.sqf",_script,1,true,true,"",'player distance _target < 4'];
		["ALL",[_object,_actionArray],"network_addAction",false,true]call network_MPExec;
	};
	case "RoadBarrier_light": {
		_actionText = "Remove Road Barrier";
		_itemName = "RoadBarrier_light";
		_script = format ['if ([player,"%1",1] call storage_add)then {deletevehicle (_this select 0)}', _itemName];
		_actionArray = [_actionText,"noscript.sqf",_script,1,true,true,"",'player distance _target < 4'];
		["ALL",[_object,_actionArray],"network_addAction",false,true]call network_MPExec;
	};
	case "10mTape": {
		_actionText = "Remove Caution Tape";
		_itemName = "10mTape";
		_script = format ['if ([player,"%1",1] call storage_add)then {deletevehicle (_this select 0)}', _itemName];
		_actionArray = [_actionText,"noscript.sqf",_script,1,true,true,"",'player distance _target < 4'];
		["ALL",[_object,_actionArray],"network_addAction",false,true]call network_MPExec;
	};
	case "TargetEpopup": {
		_actionText = "Reset Targets";
		_script = '{_x animate["terc",0]} count (nearestobjects [getpos player, ["TargetEpopup"],  500])';
		_actionArray = [_actionText,"noscript.sqf",_script,1,true,true,"",'player distance _target < 10'];
		["ALL",[_object,_actionArray],"network_addAction",false,true]call network_MPExec;
	};
};

true
