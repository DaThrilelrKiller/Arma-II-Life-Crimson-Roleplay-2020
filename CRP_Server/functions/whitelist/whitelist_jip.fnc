private ["_unit","_side","_uid","_name","_return","_value"];

_unit = _this select 0;
_side = _this select 1;
_uid = getPlayerUid _unit;
_name = name _unit;
_return = [];

{
	_value = [format["%1 - %2","Whitelist",_uid],"Whitelist",_x select 1,false]call s_stats_read;
	_return set [_forEachIndex,_value];
}forEach whitelist_data;

[_unit,_return,"whitelist_load",false,false]call network_MPExec;