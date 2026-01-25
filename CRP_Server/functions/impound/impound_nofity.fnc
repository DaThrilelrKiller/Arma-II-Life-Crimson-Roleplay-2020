private ["_name","_unit","_owners","_uid","_location"];

_name = _this select 0;
_unit = _this select 1;
_owners = _this select 2;
_side = _this select 3;
_location = _this select 4;

_uid = getPlayerUid player;

if (_uid in _owners && {dtk_side == _side})then {
	server globalchat format ["%1 has impound (%2) near %3 which you have the keys to!",_unit,_name,_location];
};