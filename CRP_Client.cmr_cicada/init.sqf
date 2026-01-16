diag_log text "[LOG]Post Initialization Started";

enableSaving [false, false];

waitUntil {!isNil "DTK_respawn"};

if (isNil "server_auth" && {dtk_client})then {
	waitUntil {time > 0};
	titleText ["Waiting for server to authenticate \n Please wait while we get everything setup", "PLAIN"];
	systemchat "Waiting for server to authenticate";
	diag_log text "Waiting for server to authenticate";	
	waitUntil {!isNil "server_auth"};	
	systemchat "Server authentication finished";
	diag_log text "Server authentication finished";
};

waitUntil {(!isNull player && {!isNull(findDisplay 46)}) or dtk_server}; 

startLoadingScreen ["","dtk_loading"];

/* Go ahead and figure out what side the player is on */
if (dtk_client)then {
	dtk_side = call {
		if (playerSide == civilian)exitWith {"CIV"};
		if (playerSide == resistance)exitWith {"UN"};
		if (playerSide == west)exitWith {"PD"};
		"unknown"
	};
	player setVariable ["dtk_side",dtk_side,true];

call compile preprocessFile format ['configuration\sidevariables\%1variables.sqf',dtk_side];
};

call compile preprocessFile  "configuration\CfgVariables.sqf";	
call compile preprocessFile "post_init.sqf";											


if (dtk_client) then {
	[] execVM "scripts\shopfarmfaclicenseactions.sqf";
	call compile preprocessFile format ['actions\%1actions.sqf',dtk_side];
	call compile preprocessFile 'actions\actions.sqf';
	call events_events;
	diag_log text "[LOG]Post Initialization finished!";
};

endLoadingScreen;
diag_log formatText ["Server: %1 Client: %2 Local: %3 World: %4 Name: %5 Type: %6 Time: %7 Alive: %8 Null: %9 Stats: %10 ",dtk_server,dtk_client,local player,WorldName,name player,typeOf player,Time,alive player,isNull player];