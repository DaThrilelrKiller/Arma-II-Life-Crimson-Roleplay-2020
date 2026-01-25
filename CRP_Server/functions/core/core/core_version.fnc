private ["_version"];
_version = getText (configFile >> "CfgPatches" >> "CRP_Version" >> "version");

if (dtk_server)exitWith {
	DTK_Server_Version = _version;
	publicVariable "DTK_Server_Version";
};

if (_version != DTK_Server_Version)then {
	waitUntil {
		_version = getText (configFile >> "CfgPatches" >> "CRP_Version" >> "version");
		systemchat format ["Addon Version %1 is outdated please update to %2",_version,DTK_Server_Version];
		sleep 2;
		(_version == DTK_Server_Version)
	};
};
