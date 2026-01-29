private ["_player","_unit","_whitelist","_value"];

_player = _this select 0;
_unit = _this select 1;
_whitelist = _this select 2;
_value = _this select 3;

missionNamespace setVariable [_whitelist,_value];

if (_value)then {
	systemchat format ["%1 whitelist you for %2",name _player,_whitelist];
	["ALL",[_player,format ["whitelist %1 for %2",name player,_whitelist]],"admin_log",false,true]call network_MPExec;
}else{
	systemchat format ["%1 removed you from %2 whitelist",name _player,_whitelist];
	["ALL",[_player,format ["%1 from %2 whitelist",name player,_whitelist]],"admin_log",false,true]call network_MPExec;
};