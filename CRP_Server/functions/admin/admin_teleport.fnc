createDialog "admin_teleport";
admin_selected = 1;
[2100, true] call dtk_PlayerListToControl;
call admin_load;


[]spawn {
onMapSingleClick "(vehicle player) setpos [_pos select 0, _pos select 1, 0];
[player,format['teleported to %1',_pos],[0.94,0.61,0,1]]call admin_logs_add;
[]call core_reveal;
";
waitUntil {!ctrlVisible 1};
onMapSingleClick "";
};