telemetry_collect = {
if (typeName _this == "ARRAY")then {
	_unit = _this select 0;
	_unit = if (isNull _unit)then {"ALL"}else{_unit};
	[_unit,player,"telemetry_collect",false,true]call network_MPExec;
}else{
	private ["_data"];
	if (dtk_server)then {
		_data = [
			"Server",
			"0",
			"Null",
			"None",
			dtk_LagTime,
			"0",
			round diag_fps,
			round diag_fpsMin,
			viewDistance,
			0,
			getResolution,
			true,
			[0,0,0]
		];
	
	}else{
		_data = [
			name player,
			getPlayerUID player,
			player,
			typeOf player,
			dtk_LagTime,
			[((time - dtk_jointime) / 60 / 60)] call BIS_fnc_timeToString,
			round diag_fps,
			round diag_fpsMin,
			viewDistance,
			dtk_grass,
			getResolution,
			alive player,
			getPos player
		];
	};
	[_this,_data,"telemetry_log",false,true]call network_MPExec;
};
};