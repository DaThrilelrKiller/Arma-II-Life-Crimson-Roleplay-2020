private ["_return"];
_return = {
	if (call (_x select 1))exitWith {true};
	false
}forEAch admin_actions;


if (_return)then {
if (dialog)exitWith {closeDialog 0; true};

createDialog "admin_menu";
admin_selected = 2;
[2100, true] call dtk_PlayerListToControl;
call admin_load;


[]call admin_console_recents;

true
};