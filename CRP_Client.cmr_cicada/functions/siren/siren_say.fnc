if (dtk_server) exitWith {};
private ["_sirnobj","_sleep","_sound"];

_sirnobj = _this select 0;
_sound = _this select 1;

if (isNil "_sound")exitWith {};

_sleep = _sound call siren_getSleep;

while {!isNull _sirnobj} do
{
	_sirnobj say _sound;
	if(dtk_server)then {
		[_sirnobj]call civilians_pullover;
	};
	sleep _sleep;
	
};
