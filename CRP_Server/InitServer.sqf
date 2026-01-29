call compile preprocessFile "\MPMissions\configuration\CfgVariables.sqf";

onPlayerDisconnected '
deleteMarker ("medical_" + _name);
deleteMarker ("Backup_" + _name);
_name call s_disconnect_disconnedted;
';

INV_ServerBuildingArray = allMissionObjects "All";
publicVariable "INV_ServerBuildingArray";

[]spawn {
	waitUntil {!isNil "DTK_MapSetup"};
	server_auth = true;
	publicVariable "server_auth";
	diag_log text "[LOG]Post Initialization finished!";
};