// Ensure core variables/functions are compiled before we run init logic.
// Some missions relied on an object init calling pre_init.sqf; this makes startup deterministic.
if (isNil "DTK_PreInitDone") then {
	DTK_PreInitDone = true;
	call compile preprocessFile "pre_init.sqf";
};

diag_log text "[LOG]Post Initialization Started";
enableSaving [false, false];
waitUntil {(!isNull player && {!isNull(findDisplay 46)}) or dtk_server}; 
startLoadingScreen ["","dtk_loading"];

west setFriend [east, 0];
east setFriend [west, 0];

west setFriend [resistance, 0];
resistance setFriend [west, 0];

west setFriend [civilian, 0];
civilian setFriend [west, 0];

east setFriend [resistance, 0];
resistance setFriend [east, 0];

east setFriend [civilian, 0];
civilian setFriend [east, 0];

resistance setFriend [civilian, 0];

if (isNil "server_auth" && {dtk_client})then {
	waitUntil {time > 0};
	diag_log text "Waiting for server to authenticate";	
	waitUntil {!isNil "server_auth"};	
	diag_log text "Server authentication finished";
};

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
diag_log format [
	"Server: %1 Client: %2 Local: %3 World: %4 Name: %5 Type: %6 Time: %7 Alive: %8 Null: %9",
	dtk_server,
	dtk_client,
	local player,
	WorldName,
	name player,
	typeOf player,
	time,
	alive player,
	isNull player
];