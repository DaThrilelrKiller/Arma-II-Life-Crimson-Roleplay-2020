_uid = _this select 0;
_name = _this select 1;
_reason = _this select 2;

if (dtk_server)then {
	"BASIX_LOG" callExtension format ["%1 (%2) has been kicked for: %3",_uid,_name,_reason];
}
else
{

	if (getPlayerUID player == _uid)then {
		systemchat format ["You are beging kick for: %1, please contact a admin if you feel this is an error",_reason];
		sleep 5;
		(findDisplay 46) closeDisplay 1;
	}
	else{
		systemchat format ["%1 (%2) has been kicked for: %3",_uid,_name,_reason];
	};
}

