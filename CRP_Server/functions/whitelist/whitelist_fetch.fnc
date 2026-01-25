private ["_player","_unit","_return","_name","_uid","_value"];
_player = _this select 0;
_unit = _this select 1;

_name = name _unit;
_uid = getPlayerUID _unit;
_return = [];

{
	_value = [format["%1 - %2","Whitelist",_uid],"Whitelist",_x select 1,false]call s_stats_read;
	_return set [_forEachIndex,_value];
}forEach whitelist_data;

[_player,_return,"whitelist_list",false,false]call network_MPExec;
