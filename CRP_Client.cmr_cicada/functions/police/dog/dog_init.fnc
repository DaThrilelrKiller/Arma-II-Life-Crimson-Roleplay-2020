if (dtk_server)exitWith {};

if (dtk_cop)then {
	[player,["Dog Control","noscript.sqf", 'ar_doggy = true', 1, false, true, "", "!ar_doggy and alive dtk_dog"]]call action_add;
	[player,["Exit Dog Control","noscript.sqf", 'ar_doggy = false', 1, false, true, "", "ar_doggy"]]call action_add;
	[player,["Follow","noscript.sqf", '[1] execVM "\CLAY_Dogs\handler\dogMove.sqf"', 1, false, true, "", "ar_doggy"]]call action_add;
	[player,["Wait","noscript.sqf", '[2] execVM "\CLAY_Dogs\handler\dogMove.sqf"', 1, false, true, "", "ar_doggy"]]call action_add;
	[player,["Move To Pos","noscript.sqf", '[3] execVM "\CLAY_Dogs\handler\dogMove.sqf"', 1, false, true, "", "ar_doggy"]]call action_add;
	[player,[" ","noscript.sqf", '', 1, false, true, "", "ar_doggy"]]call action_add;
	[player,["Attack Target","noscript.sqf", '[cursorTarget]spawn dog_attack', 1, false, true, "", "ar_doggy"]]call action_add;
	[player,["Drug Search","noscript.sqf", '[cursorTarget]spawn dog_search', 1, false, true, "", "ar_doggy"]]call action_add;
	[player,["Board Car","noscript.sqf", '[cursorTarget]spawn dog_board', 1, false, true, "", "ar_doggy"]]call action_add;
	[player,["Dismount","noscript.sqf", '[]spawn dog_dismount', 1, false, true, "", "ar_doggy"]]call action_add;

	dogspawn addaction ["","noscript.sqf","[]call dog_buy", 25, false, true, "LeanRight","player distance _target < 5 && {!([_target,'Buy K9 (E)','\crp_data\images\tags\K9']call tag_show)}"];
	dogspawn2 addaction ["","noscript.sqf","[]call dog_buy", 25, false, true, "LeanRight","player distance _target < 5 && {!([_target,'Buy K9 (E)','\crp_data\images\tags\K9']call tag_show)}"];

};