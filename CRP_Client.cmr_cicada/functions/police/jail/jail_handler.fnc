private["_unit","_cop","_time","_endTime","_unit","_unit","_unit"];

_unit = _this select 0;
_cop = _this select 1;
_time = _this select 2;
_time = _time * 60;
_endTime = _unit getVariable["end_time",time + _time];
_unit setVariable ["ar_cuffed",false,true];


_unit setPosAtl [7117.99,3589.76,1.5];
_unit setDamage 0;
_unit call police_disarm;
if !(dtk_server) then {
	["olrpg_jailinmate"]call clothing_switch;
}else {
	_unit disableAI "MOVE";
};

dtk_disabledkeys = [44,47];
dtk_hunger      = 0;

["ALL",[_unit,"normal"],"network_SwitchMove",false,true]call network_MPExec;

while {true} do {

	if (time > _endTime)exitWith {
		[]call jail_free;
	};
	if (_unit distance [7117.99,3589.76,0] >= 50 && {time < _endTime}) exitWith jail_escape;
	
	_bail = (_endTime - time) * 150;
	hintsilent format["Time until release: %1\nBail left to pay: %2", [(_endTime - time) / 60 / 60, "HH:MM:SS"] call BIS_fnc_timeToString, [_bail]call main_formatMoney];
	sleep 0.5;
};