// Admin function to add employee to whitelist via console/script
// Usage: [player, targetPlayer] call S_credit_addEmployee;
// Or: [player, "76561198123456789"] call S_credit_addEmployee;

private ["_player","_target"];
_player = _this select 0;
_target = _this select 1;

[_player, _target] call S_credit_addEmployee;
