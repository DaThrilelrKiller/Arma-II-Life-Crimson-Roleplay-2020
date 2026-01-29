private ["_player","_vehicle","_uid","_keychain","_return"];

_player = _this select 0;
_vehicle = _this select 1;
_uid = getPlayerUID _player;
_keychain = _vehicle getVariable["dtk_keys",[]];
if (count _keychain == 0)exitWith {false};

_return = if (_uid in _keychain)then {true}else{false};
_return