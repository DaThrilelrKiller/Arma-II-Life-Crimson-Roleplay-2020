_action         = _this select 0;
_item        = _this select 1;
_amount       = _this select 2;
_name = (_item call config_displayname);

if(primaryweapon player == "" and secondaryweapon player == "")then{player playmove "AmovPercMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon"}else{player playmove "AinvPknlMstpSlayWrflDnon"};

if (_action == "uebergabe") then 
{	

	_player   = call compile(_this select 3);

	/* go ahead and check to make sure you are able to give the item to the player */
	if (_amount <= 0) exitWith {systemChat  "You cannot give less than 0";};
	if (_player == player)                         exitWith {systemChat  localize "STRS_inv_inventar_uebergabe_self";};
	if (player distance _player > 20)              exitWith {systemChat  localize "STRS_inv_inventar_uebergabe_distance";};	
	if (!(_item call config_giveable))               exitWith {systemChat  localize "STRS_inv_inventar_uebergabe_verbot";};

	/* go ahead and add and if true then remove from player giving */
	if ([_player,_item,_amount] call storage_add)then {
		[player,_item,-_amount] call storage_add;
		/* notify the player that they have recived the item */
		[_player,["true",format ['You have recived %1 of %2 from %3',_amount, _name,name player],3],"network_chat",false,false]call network_MPExec;
	};
					
	systemChat  format [localize "STRS_inv_inventar_uebergabe_success_self", name _player, (_amount call string_intToString), _name];

};