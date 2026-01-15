private ["_weapon"];
_weapon = currentWeapon player;
if (_weapon in nonlethalweapons)then {false}else {true};