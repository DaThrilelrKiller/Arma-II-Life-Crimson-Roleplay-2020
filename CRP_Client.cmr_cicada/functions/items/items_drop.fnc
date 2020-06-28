private ["_item","_amount","_image","_class","_pos","_object","_name13"];

_item   = _this select 0; 
_amount = _this select 1;
_image = format ["\crp_data\images\items\%1",[_item]call config_image];

if (_amount <= 0) exitwith {};

if (_item call config_dropable) then {

	if ([player,_item,-_amount] call storage_add) then {
	
	systemChat  localize "STRS_inv_inventar_weggeworfen";	

	if(primaryweapon player == "" and secondaryweapon player == "")then{player playmove "AmovPercMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon"}else{player playmove "AinvPknlMstpSlayWrflDnon"};

	sleep 1.5;

	private "_class";
	_class = _item call config_class;
	_class = if (isClass (configFile >> "CfgVehicles" >> _class))then{_class}else{"Suitcase"};
	
	_pos = getposASL player;
	_object = _class createvehicle _pos;
	_object setposASL getposASL player;
	_name13 = _item call config_displayname;
	_object call core_setVarName;	
	
	
	["ALL",[_object,['','noscript.sqf',format['%1 spawn items_pickup',[_object, _item, _amount]],25,false,true,'LeanRight',format ['player distance _target < 5 && {!pickingup} && {!([_target,"Pick up (%3) %1 (E)","%2"]call tag_show)}',_name13,_image,_amount]]],"network_addAction",false,true]call network_MPExec;
	
	} else {
		systemChat  localize "STRS_inv_inventar_drop_zuwenig";
	};

} 
else {
	systemChat  localize "STRS_inv_inventar_ablege_verbot";
};

