private ["_message","_defendant"];
_message = _this select 0;
_defendant = _this select 1;

if (player == _defendant) then {
	systemChat _message;
	hint _message;
};
