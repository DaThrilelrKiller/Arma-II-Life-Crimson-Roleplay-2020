_control = _this select 0;
_newValue = round(_this select 1);

dtk_grass = _newValue;
setTerrainGrid (dtk_detail select dtk_grass);
ctrlSetText [5,format["Terain Detail Set to : %1",_newValue]];
