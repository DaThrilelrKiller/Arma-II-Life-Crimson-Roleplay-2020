private ["_uid","_banned"];
diag_log str _this;

_banned = _this select 0;
_uid = _this select 1;

if (_uid in _banned)then {
systemchat "you have been banned fron the server!! Contact the admins";
(findDisplay 46) closeDisplay 1;
};