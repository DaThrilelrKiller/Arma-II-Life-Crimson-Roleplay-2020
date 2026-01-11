_side = _this select 1;
_uid = getPlayerUID(_this select 0);
_player = (_this select 0);
_value = _this select 2;

_year = date select 0;
_month = date select 1;
_day = date select 2;

_key = format["time_%1_%2_%3_%4",_side,_year,_month,_day];


[format["Timelog - %1",_uid], "Time", _key, _value] call s_stats_write;