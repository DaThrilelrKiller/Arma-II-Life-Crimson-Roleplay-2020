private ["_unit","_killer"];
_unit = _this select 0;
_killer = _this select 1;

if (player == _killer)then {
	[player,"geld",15000] call storage_add;
	systemchat format["You have collected 15k for killing %1",name _unit];
};