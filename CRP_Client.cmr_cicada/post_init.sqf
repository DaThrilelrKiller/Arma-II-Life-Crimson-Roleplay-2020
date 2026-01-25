// setup_init is client-side module bootstrap; dedicated server has no UI/player context for it.
if (dtk_client) then {
	call setup_init;
};

if (dtk_server)then {
	call compile preprocessFile "\MPMissions\functions\post_init.sqf";
};

