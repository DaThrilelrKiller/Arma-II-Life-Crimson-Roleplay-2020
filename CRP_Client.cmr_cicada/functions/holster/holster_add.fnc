private ["_holster","_weapon","_holstered","_name"];

_holster = _this select 0;
_weapon = (weaponState player)select 0;
_holstered = player getVariable [_holster,""];

if (_holstered != "")exitWith {
	if (_weapon != "")then {

	};
	call holster_remove;
};

if (_weapon == "")exitwith {};

_kind = [_weapon,_holster] call holster_kind;;

if (_kind)then {
	player removeWeapon _weapon;
	player setVariable [_holster,_weapon,true];
}else{
	_name = getText (configFile >> "cfgWeapons" >> _weapon >> "displayName");
	systemchat format ["%1 you cannot put %2 in your %3 holster",name player,_name,_holster];
};