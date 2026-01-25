private _message = _this select 0;
private _defendant = _this select 1;

if (player == _defendant) then {
	systemChat _message;
	hint _message;
};
