call setup_init;

if (dtk_server)then {
	call compile preprocessFile "\MPMissions\functions\post_init.sqf";
};

