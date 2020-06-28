private ["_object","_item","_name","_amount"];

if (pickingup)exitWith {};
pickingup = true;

_object	    = _this select 0;
_item  	    = _this select 1;
_amount    = _this select 2;
_name       = _item call config_displayname;

if ([_object, playableUnits, 5] call ISSE_ArrayNumberNear > 1)exitWith {
	systemChat "There Are To Many People Near This Item!";
	pickingup = false; 
};

if(primaryweapon player == "" and secondaryweapon player == "")then{
	player playmove "AmovPercMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon"
}else{
	player playmove "AinvPknlMstpSlayWrflDnon"
};

if ([player,_item,_amount] call storage_add)then {
	deletevehicle _object;
	systemChat  format["You Picked Up %1 %2", _amount, _name];	
}else{
	systemChat "You have reached your max weight";
};

sleep 1;

pickingup = false;



