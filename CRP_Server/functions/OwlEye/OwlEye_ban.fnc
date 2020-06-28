private ["_uid","_name","_reason"];

_uid = _this select 0;
_name = _this select 1;
_reason = _this select 2;

if (typeName _uid == "OBJECT") exitWith {
	["ALL",[getPlayerUID player,name player,_reason],"OwlEye_ban",false,true]call network_MPExec;
};

if (dtk_server)then {
	"BASIX_BAN" callExtension format ["%1 (%2)-%3",_uid,_name,_reason];
	"BASIX_LOG" callExtension format ["%1 (%2) has been baned for: %3",_uid,_name,_reason];
}
else
{
	if (getPlayerUID player == _uid)then {
	systemchat "you have baned banned fron the server!! Contact the admins";
	(findDisplay 46) closeDisplay 0;
	}
	else{
	systemchat format ["%1 was baned from the server",_name];
	};
};