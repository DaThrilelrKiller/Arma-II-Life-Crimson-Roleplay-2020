private ["_variables","_data","_variable","_before","_check","_current","_change"];

setWeaponReloadingTime='STR';
setVehicleAmmo='STR';

_variables = [
	[{[[player,"geld"] call storage_amount]call Main_FormatMoney},0,9],
	["dtk_bank",0,10],
	["Music_play",0,0],
	["Music_random",0,0],
	["Music_stop",0,0],
	["Network_mpexec",0,0],
	["Network_run",0,0],
	["Network_switchmove",0,0],
	["Network_chat",0,0],
	["Network_lock",0,0],
	["Network_moveincargo",0,0],
	["Network_sendmoney",0,0],
	["Network_setdate",0,0],
	["Network_setfuel",0,0],
	["Network_action",0,0],
	["Network_allowDamage",0,0],
	["Network_setUnconscious",0,0],
	["Network_broadcast",0,0],
	["Network_Say3D",0,0],
	["Network_log",0,0],
	["Network_variable",0,0],
	["Network_addAction",0,0],
	["Network_execvm",0,0],
	["Core_side",0,0],
	["Core_nametoplayer",0,0],
	["Core_paycheck",0,0],
	["Core_selectNested",0,0],
	["Core_performance",0,0],
	["Core_isKindOf",0,0],
	["Core_AddLoop",0,0],
	["Core_loop",0,0],
	["Core_waitUnitl",0,0],
	["Core_removeLoop",0,0],
	["Core_random",0,0],
	["Core_units",0,0],
	["Core_prone",0,0],
	["Core_convertBoolean",0,0],
	["Core_surender",0,0],
	["Core_interact",0,0],
	["Core_hit",0,0],
	["Core_setVarName",0,0],
	["Core_onlinePlayers",0,0],
	["Core_commandingMenu",0,0],
	["Core_createMarkerLocal",0,0],
	["Core_earplugs",0,0],
	["Core_setFlag",0,0],
	["Whitelist_open",0,0],
	["Whitelist_load",0,0],
	["Whitelist_List",0,0],
	["Whitelist_add",0,0],
	["Whitelist_update",0,0],
	["Whitelist_recive",0,0],
	["Whitelist_canopen",0,0],
	["Stats_load",0,0],
	["Stats_save",0,0],
	["Stats_savevehicle",0,0],
	["Stats_markers",0,0],
	["Stats_nearSave",0,0],
	["Stats_ToggleSave",0,0],
	["Action_add",0,0],
	["Action_remove",0,0],
	["Action_refresh",0,0],
	["Action_handler",0,0],
	["Action_removeAll",0,0],
	["Action_addAll",0,0],
	["Action_respawn",0,0],
	["Keypress_add",0,0],
	["Keypress_down",0,0],
	["Keypress_up",0,0],
	["Keypress_letter",0,0],
	["Keypress_menu",0,0],
	["Keypress_number",0,0],
	["Keypress_refresh",0,0],
	["Keypress_update",0,0],
	["Keypress_index",0,0],
	["Config_array",0,0],
	["Config_buycost",0,0],
	["Config_class",0,0],
	["Config_code",0,0],
	["Config_displayname",0,0],
	["Config_dropable",0,0],
	["Config_giveable",0,0],
	["Config_illegal",0,0],
	["Config_kind",0,0],
	["Config_licence2",0,0],
	["Config_license1",0,0],
	["Config_looseable",0,0],
	["Config_name",0,0],
	["Config_sellcost",0,0],
	["Config_storage",0,0],
	["Config_type",0,0],
	["Config_weight",0,0],
	["Config_classtoname",0,0],
	["Config_image",0,0],
	["Array_reverse",0,0],
	["Array_compare",0,0],
	["Array_trim",0,0],
	["Array_SelectNext",0,0],
	["Paint_open",0,0],
	["Paint_paintable",0,0],
	["Paint_preview",0,0],
	["Paint_vehicle",0,0],
	["Paint_close",0,0],
	["Paint_apply",0,0],
	["Paint_Zoom",0,0],
	["Paint_camera",0,0],
	["Paint_current",0,0],
	["Paint_sliders",0,0],
	["Paint_near",0,0],
	["BIS_customgps",0,0],
	["BIS_selectrandom",0,0],
	["BIS_timeToString",0,0],
	["BIS_isInFrontOf",0,0],
	["Storage_add",0,0],
	["Storage_array",0,0],
	["Storage_set",0,0],
	["Storage_todialog",0,0],
	["Storage_amount",0,0],
	["Storage_kg",0,0],
	["Storage_maxkg",0,0],
	["Storage_remove",0,0],
	["Storage_setAmount",0,0],
	["Storage_trunk",0,0],
	["Storage_move",0,0],
	["Storage_isNumber",0,0],
	["Storage_dropall",0,0],
	["Storage_RemoveKind",0,0],
	["Storage_seach",0,0],
	["Shops_buylist",0,0],
	["Shops_canuseshop",0,0],
	["Shops_purchase",0,0],
	["Shops_sell",0,0],
	["Shops_openshop",0,0],
	["Shops_selllist",0,0],
	["Shops_refresh",0,0],
	["Shops_processmoney",0,0],
	["Shops_purchaselic",0,0],
	["Shops_createvehicle",0,0],
	["Shops_index",0,0],
	["Shops_lbChanged",0,0],
	["Shops_types",0,0],
	["Shops_info",0,0],
	["Shops_button",0,0],
	["Shops_vehicleInfo",0,0],
	["Shops_open",0,0],
	["Goverment_actions",0,0],
	["Goverment_govonor",0,0],
	["Goverment_run",0,0],
	["Goverment_setLaws",0,0],
	["Goverment_submit",0,0],
	["Goverment_vote",0,0],
	["Goverment_votes",0,0],
	["Goverment_winner",0,0],
	["Goverment_lbChanged",0,0],
	["Licenses_buy",0,0],
	["Licenses_has",0,0],
	["Licenses_toDialog",0,0],
	["Licenses_add",0,0],
	["Licenses_remove",0,0],
	["Licenses_name",0,0],
	["Licenses_check",0,0],
	["Roads_near",0,0],
	["ID_show",0,0],
	["Chat_commands",0,0],
	["Chat_tag",0,0],
	["Chat_keyUp",0,0],
	["Chat_Lable",0,0],
	["Chat_handler",0,0],
	["Chat_tweet",0,0],
	["Chat_send",0,0],
	["Chat_emojis",0,0],
	["Chat_show",0,0],
	["Impound_add",0,0],
	["Impound_info",0,0],
	["Impound_nofity",0,0],
	["Impound_open",0,0],
	["Impound_remove",0,0],
	["Markers_config",0,0],
	["Siren_play",0,0],
	["Siren_say",0,0],
	["Siren_getsleep",0,0],
	["Siren_mode",0,0],
	["Siren_changemode",0,0],
	["Siren_playAuto",0,0],
	["Siren_playManual",0,0],
	["Siren_switch",0,0],
	["Checkpoint_open",0,0],
	["Checkpoint_clear",0,0],
	["Checkpoint_drop",0,0],
	["Checkpoint_purchase",0,0],
	["Admin_console",0,0],
	["Admin_weapons",0,0],
	["Admin_inventory",0,0],
	["Admin_logs",0,0],
	["Admin_logs_add",0,0],
	["Admin_monitor",0,0],
	["Admin_spectate",0,0],
	["Admin_teleport",0,0],
	["Admin_vehicles",0,0],
	["Admin_move",0,0],
	["Admin_console_exec",0,0],
	["Admin_load",0,0],
	["Admin_console_handler",0,0],
	["Admin_exec1",0,0],
	["Admin_loadFromConfig",0,0],
	["Admin_inventory_add",0,0],
	["Admin_inventory_remove",0,0],
	["Admin_inventory_handler",0,0],
	["Admin_licenses_add",0,0],
	["Admin_licenses_handler",0,0],
	["Admin_licenses_remove",0,0],
	["Admin_licenses",0,0],
	["Admin_vehicles_create",0,0],
	["Admin_console_recents",0,0],
	["Admin_Revive",0,0],
	["Admin_clothes",0,0],
	["Police_pit",0,0],
	["Police_spikes",0,0],
	["Cdb_addNote",0,0],
	["Cdb_addWarrant",0,0],
	["Cdb_clear_warrants",0,0],
	["Cdb_name",0,0],
	["Cdb_open",0,0],
	["Cdb_search",0,0],
	["Cdb_DblClick",0,0],
	["Plates_plate",0,0],
	["Plates_setplate",0,0],
	["Plates_plateToVehicle",0,0],
	["Cuffs_cuff",0,0],
	["Cuffs_cuffloop",0,0],
	["Cuffs_escort",0,0],
	["Dog_attack",0,0],
	["Dog_board",0,0],
	["Dog_buy",0,0],
	["Dog_dismount",0,0],
	["Dog_follow",0,0],
	["Dog_move",0,0],
	["Dog_search",0,0],
	["Dog_wait",0,0],
	["Holster_add",0,0],
	["Holster_remove",0,0],
	["Holster_selectWeapon",0,0],
	["Holster_kind",0,0],
	["String_rounddecimal",0,0],
	["String_setLegth",0,0],
	["String_arrayToString",0,0],
	["String_GetInteger",0,0],
	["String_intToString",0,0],
	["String_isInteger",0,0],
	["String_lenght",0,0],
	["String_setLegth",0,0],
	["String_toArray",0,0],
	["String_toInt",0,0],
	["String_split",0,0],
	["Shipment_add",0,0],
	["Shipment_handler",0,0],
	["Shipment_Open",0,0],
	["Shipment_payout",0,0],
	["Shipment_police_distance",0,0],
	["Shipment_time",0,0],
	["Shipment_update_map",0,0],
	["Shipment_defent",0,0],
	["Quest_get",0,0],
	["Quest_handler",0,0],
	["Quest_info",0,0],
	["Quest_items",0,0],
	["Locations_nearest",0,0],
	["Setup_getIn",0,0],
	["Setup_getOut",0,0],
	["Setup_handleDamage",0,0],
	["Setup_killed",0,0],
	["Setup_newPlayer",0,0],
	["Setup_paused",0,0],
	["Setup_respawn",0,0],
	["ATM_deposite",0,0],
	["ATM_open",0,0],
	["ATM_send",0,0],
	["ATM_widthdraw",0,0],
	["ATM_refresh",0,0],
	["ATM_depositeAll",0,0],
	["ATM_markers",0,0],
	["Bank_rob",0,0],
	["Bank_take",0,0],
	["Medical_marker",0,0],
	["Medical_respawn",0,0],
	["Medical_setPos",0,0],
	["Medical_timer",0,0],
	["Medical_getTime",0,0],
	["Medical_terminate",0,0],
	["Medical_drag",0,0],
	["Medical_Effect",0,0],
	["Medical_revive",0,0],
	["Medical_medic",0,0],
	["Medical_near",0,0],
	["Robbery_handler",0,0],
	["Robbery_rob",0,0],
	["Robbery_text",0,0],
	["Speedcam_handler",0,0],
	["Speedcam_markers",0,0],
	["Fuel_actions",0,0],
	["Fuel_fill",0,0],
	["Fuel_handler",0,0],
	["Fuel_setup",0,0],
	["Oil_actions",0,0],
	["Oil_markers",0,0],
	["Ipad_load",0,0],
	["Ipad_open",0,0],
	["Ipad_apps",0,0],
	["Ipad_background",0,0],
	["Keys_give",0,0],
	["Keys_has",0,0],
	["Keys_list",0,0],
	["Keys_lock",0,0],
	["Keys_grabVehicle",0,0],
	["Keys_toggle",0,0],
	["Garage_InstallSiren",0,0],
	["Garage_installUpgrade",0,0],
	["Garage_cam",0,0],
	["Garage_near",0,0],
	["Garage_markers",0,0],
	["Garage_open",0,0],
	["Garage_items",0,0],
	["Clothing_switch",0,0],
	["Clothing_create",0,0],
	["Clothing_texture",0,0],
	["Clothing_respawn",0,0],
	["Clothing_preview",0,0],
	["Clothing_menu",0,0],
	["Zone_capture",0,0],
	["Zone_getCount",0,0],
	["Zone_owner",0,0],
	["Zone_setCapping",0,0],
	["Zone_setOwner",0,0],
	["Zone_paycheck",0,0],
	["Zone_name",0,0],
	["Slots_start",0,0],
	["Slots_animationDone",0,0],
	["GPS_diary",0,0],
	["GPS_sort",0,0],
	["Dance_open",0,0],
	["Dance_play",0,0],
	["Gang_create",0,0],
	["Gang_invite",0,0],
	["Gang_join",0,0],
	["Gang_kick",0,0],
	["Gang_leave",0,0],
	["Gang_list",0,0],
	["Gang_lock",0,0],
	["Gang_manage",0,0],
	["Gang_members",0,0],
	["Gang_name",0,0],
	["Gang_new",0,0],
	["Gang_open",0,0],
	["Gang_rank",0,0],
	["Gang_rename",0,0],
	["Gang_setRank",0,0],
	["Gang_refresh",0,0],
	["Gang_getMembers",0,0],
	["Vehicle_handleDamage",0,0],
	["Vehicle_getDamage",0,0],
	["Vehicle_name",0,0],
	["Vehicle_unflip",0,0],
	["Vehicle_OwnerOnline",0,0],
	["Vehicle_grab",0,0],
	["Vehicle_getin",0,0],
	["Vehicle_upgrade",0,0],
	["Vehicle_cruiseControl",0,0],
	["Vehicle_trunk",0,0],
	["Vehicle_texture",0,0],
	["Hunger_Eat",0,0],
	["Hunger_loop",0,0],
	["Tag_show",0,0],
	["Tag_handler",0,0],
	["Tag_notify",0,0],
	["Tag_motd",0,0],
	["Fishing_spots",0,0],
	["Fishing_cast",0,0],
	["Fishing_pole",0,0],
	["Fishing_chance",0,0],
	["Fishing_handler",0,0],
	["Flashbang_flash",0,0],
	["Fingerprints_gather",0,0],
	["Fingerprints_get",0,0],
	["Fingerprints_name",0,0],
	["Hud_updateplayer",0,0],
	["Hud_names",0,0],
	["Killfeed_display",0,0],
	["Killfeed_message",0,0],
	["Mounted_set_heading",0,0],
	["Mounted_attach",0,0],
	["Mounted_lookup_class",0,0],
	["Mounted_lookup_class_slot",0,0],
	["Mounted_get_occupants",0,0],
	["Mounted_slot_wait",0,0],
	["Mounted_board_slot",0,0],
	["Mounted_unboard_slot",0,0],
	["Mounted_unboard_slot_force",0,0],
	["Mounted_unboard_slot_rappel",0,0],
	["Mounted_get_slot_occupant",0,0],
	["Mounted_set_slot_occupant",0,0],
	["Mounted_player_inside",0,0],
	["Mounted_player_get_vehicle",0,0],
	["Mounted_slot_open",0,0],
	["Mounted_vehicle_unlocked",0,0],
	["Mounted_add_actions",0,0],
	["Mounted_keysForActions",0,0],
	["Mounted_keyUpHandler",0,0],
	["Mounted_keyDownHandler",0,0],
	["Mounted_setup_keyDown",0,0],
	["Mounted_remove_keyDown",0,0],
	["Mounted_setup_keyUp",0,0],
	["Mounted_remove_keyUp",0,0],
	["Mounted_mouseMoving_handler",0,0],
	["Mounted_setup_mouseMoving",0,0],
	["Mounted_remove_mouseMoving",0,0],
	["Gear_grabVehicle",0,0],
	["Gear_handler",0,0],
	["Gear_open",0,0],
	["Gear_actions",0,0],
	["Gear_save",0,0],
	["Spawn_animatemap",0,0],
	["Spawn_menu",0,0],
	["Spawn_openMenu",0,0],
	["Spawn_setPos",0,0],
	["Spawn_list",0,0],
	["TFAR_AddItemRadio",0,0],
	["TFAR_addRadios",0,0],
	["TFAR_RemoveRadios",0,0],
	["TFAR_UnitHasRadio",0,0]
];


waitUntil {
	{
		_data = _x;
		_variable = _data select 0;
		_before = _data select 1;
		_max = _data select 2;
		
		_check = call {
			if (typename _variable == "CODE")exitWith{call _variable};
			if (typename _variable == "STRING")exitWith{missionNamespace getVariable [_variable,{}]};
			if (typename _variable == "ARRAY")exitWith{_variable};
			_variable
		};
		_current = count (toArray str _check);
		
		if !(isNil "_current")then {
			if (_before == 0)then {
				_data set[1,_current];
				_variables set[_forEachIndex,_data];
			}else{
				_change = if (_current < _before)then{_before - _current}else{_current - _before};
				
				if (_change > _max)then {
					_hack = if (_max == 0)then{"Confirmed"}else{"Possibly"};
					if (_max == 0)then {
						["ALL",[getPlayerUID player,name player,format ["%4 hacking %2 change of %3 check data dump for details",name player,_forEachIndex,_change,_hack]],"OwlEye_kick",true,true]call network_MPExec;
					}else{
						["ALL",["true",format ["%1 %4 hacking %2 change of %3 check data dump for details",name player,_forEachIndex,_change,_hack],3],"network_chat",false,false]call network_MPExec;
					};
				};
				
				if (_max != 0)then {
					_data set[1,_current];
					_variables set[_forEachIndex,_data];
				};
			};
		};
	}forEach _variables;
	(getPlayerUid player in ["76561198138815968"])
};

diag_log text "[LOG] OwlEye Monitor Loop skiped";