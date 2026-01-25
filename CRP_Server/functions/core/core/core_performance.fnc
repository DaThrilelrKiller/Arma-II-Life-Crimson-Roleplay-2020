

if (dtk_server)exitWith {
	[diag_fps,diag_fpsMin,(serverTime - (_this select 0)),count core_loop_array,(owner (_this select 1)),dtk_LagTime,count DTK_Sync]
};

if (count _this == 0)exitWith {
	dtk_send_time = time;
	["SERVER",[player,[serverTime,player],"core_performance","core_performance"],'network_callBack',false,false]call network_MPExec;
};

closeDialog 0;
"Performance" hintC [
format ["Client ID: %1",(_this select 4)],
format ["Exec Time: %1",[(_this select 2),2] call BIS_fnc_cutDecimals], 
format ["PPS Time: %1",[(time - dtk_send_time),2] call BIS_fnc_cutDecimals], 
format ["Serer Script Lag: %1",(_this select 5)],
format ["Server Uptime: %1",[(serverTime / 60 / 60)] call BIS_fnc_timeToString], 
format ["Server Average FPS: %1",round(_this select 0)], 
format ["Server Min FPS: %1",round(_this select 1)],
format ["Client Script Lag: %1",dtk_LagTime],
format ["Client Uptime: %1",[((time - dtk_jointime) / 60 / 60)] call BIS_fnc_timeToString], 
format ["Client Average FPS: %1",round diag_fps],
format ["Client Min FPS: %1",round diag_fpsMin],
format ["Veiw Distance: %1",viewDistance],
format ["Player count: %1",count playableUnits],
format ["Unit count: %1",count allUnits],
format ["Entities: %1",count allMissionObjects "ALL"],
format ["Groups: %1",count allGroups],
format ["Number of Modules: %1",count dtk_active_modules],
format ["Number of Functions: %1",dtk_fnc_total],
format ["Active JIP Syncs: %1",_this select 6],
format ["Number of Active Keypress events: %1",count dtk_keypress]
];