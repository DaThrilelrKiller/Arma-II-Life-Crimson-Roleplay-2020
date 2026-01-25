private["_checkTeam", "_zone"];
_zonestOwn = _this select 0;
_chkTeamOwn = _this select 1;
_zonePole = _this select 2;
_zoneFlag = _this select 3;

_data = call {
	if (_chkTeamOwn == "")exitWith {
		["ColorYellow","\ca\ca_e\data\flag_white_co.paa","Empty"]
	};
	["ColorRed","\ca\data\Flag_chdkz_co.paa","Faction_INS"]
};

_zonestOwn setMarkerColor (_data select 0);
_zoneFlag setMarkerText _chkTeamOwn;
["SERVER",[_zonePole,(_data select 1)],"core_setFlag",false,false]call network_MPExec;