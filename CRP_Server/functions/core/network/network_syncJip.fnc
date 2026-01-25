/*
	0. Object SyncJIP is attached to 
	1. function called
	2. prams for function
*/


if (dtk_server)exitWith {
	DTK_Sync set[count DTK_Sync,_this];
};

(_this select 2) call (missionNamespace getVariable[(_this select 1),{}]);
