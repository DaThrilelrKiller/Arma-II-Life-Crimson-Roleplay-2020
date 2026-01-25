_control = _this select 0;
_newValue = round(_this select 1);

if (isNil "dtk_detail") then {
	dtk_detail = [50, 25, 12.5, 6.25, 3.125];
};
if (_newValue < 0 || _newValue >= count dtk_detail) then {
	_newValue = 0;
};
dtk_grass = _newValue;
setTerrainGrid (dtk_detail select dtk_grass);
ctrlSetText [5,format["Terain Detail Set to : %1",_newValue]];
