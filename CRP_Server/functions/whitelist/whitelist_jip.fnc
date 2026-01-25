private ["_unit","_side","_uid","_name","_return","_value"];

_unit = _this select 0;
_side = _this select 1;
_uid = getPlayerUID _unit;
_name = name _unit;
_return = [];

{
	_value = [format["%1 - %2","Whitelist",_uid],"Whitelist",_x select 1,false]call s_stats_read;
	_return set [_forEachIndex,_value];

	// If this joining player is the whitelisted Mayor/Governor, make them the active governor.
	if ((_x select 1) == "mayor_id" && {_value}) then
	{
		server setVariable ["governor",_unit,true];
	};
}forEach whitelist_data;

[_unit,_return,"whitelist_load",false,false]call network_MPExec;