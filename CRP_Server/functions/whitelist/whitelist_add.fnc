private ["_player","_unit","_whitelist","_value","_uid","_text"];

_player = _this select 0;
_unit = _this select 1;
_whitelist = _this select 2;
_value = _this select 3;

_uid = getPlayerUID _unit;

[format["%1 - %2","Whitelist",_uid], "Whitelist", _whitelist, _value] call s_stats_write;

[_unit,_this,"whitelist_recive",false,false]call network_MPExec;
[_player,[],"whitelist_update",false,false]call network_MPExec;


_text = if (_value)then {"Whitelisted"}else{"Un-Whitelisted"};
[format['[Whitelist]%1 %4 %2 from %3',name _player,name _unit,_whitelist,_text],'#1110']call log_send;

// If Mayor/Governor whitelist is changed, update the active governor.
if (_whitelist == "mayor_id") then
{
	if (_value) then
	{
		server setVariable ["governor",_unit,true];
		["ALL",["dtk_client","Government",format["%1 has been appointed Mayor (Governor).",name _unit]],"Main_Notification",true,false]call network_MPExec;
	}
	else
	{
		if ((server getVariable ["governor",objNull]) == _unit) then
		{
			server setVariable ["governor",objNull,true];
			["ALL",["dtk_client","Government",format["%1 is no longer the Mayor (Governor).",name _unit]],"Main_Notification",true,false]call network_MPExec;
		};
	};
};