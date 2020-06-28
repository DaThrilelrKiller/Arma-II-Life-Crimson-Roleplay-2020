private ["_uid","_side","_name","_value","_unit","_saved","_index"];

_unit = _this select 0;
_uid = if ((typeName _unit) == "STRING")then {_unit}else{getPlayerUID _unit};

_side = _this select 1;
_name = _this select 2;
_index = _this select 3;
_value = _this select 4;

_saved = [_uid,_side, format ["%2%1",_index,_name],_value]call s_stats_write;
if !(_saved)then {
	[_unit,format["%1 failed to save to your stats (%2,%3,%4)",_name,_uid,_side,_value],{systemchat _this},false,false]call network_mpexec;
};