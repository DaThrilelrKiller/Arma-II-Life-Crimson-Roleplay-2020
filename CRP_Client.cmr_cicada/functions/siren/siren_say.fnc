if (dtk_server) exitWith {};
private ["_sirnobj","_sleep","_sound"];

_sirnobj = _this select 0;
_sound = _this select 1;

if (isNil "_sound")exitWith {};

_sleep = _sound call siren_getSleep;

while {!isNull _sirnobj} do
{
	_sirnobj say _sound;
	if(local _sirnobj && {!isNull cursorTarget})then {
		systemchat "Pull Over!";
		[cursorTarget,[_sirnobj,cursorTarget],"civilians_pullover",false,false]call network_MPExec;
	};
	sleep _sleep;
	
};