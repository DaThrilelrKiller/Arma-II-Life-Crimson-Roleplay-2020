// Handle JIP (Join In Progress) - load credit data when player joins
private ["_player","_uid"];

_player = _this select 0;
_uid = getPlayerUID _player;

[_player] call S_credit_load;
