_object = _this select 0;
_unit = _this select 1;

if (dtk_server)exitWith {
	[_unit,[],{[format["No finger prints found",_name],'\crp_data\images\tags\fingerprint']call tag_notify;},false,false]call network_MPExec;
};

_random = _object getVariable ["dtk_prints",([55]call Main_Random)];
_object setVariable["dtk_prints",_random];

if (_random || {player == _unit})then {
	[_unit,[player,dtk_dob],"id_show",false,false]call network_MPExec;
}else{
	[_unit,[],{[format["No finger prints found",_name],'\crp_data\images\tags\fingerprint']call tag_notify;},false,false]call network_MPExec;
};