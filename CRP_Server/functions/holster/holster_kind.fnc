private ["_weapon","_kind","_pistolConfig","_return"];

_weapon = _this select 0;
_kind = _this select 1;

_unknownConfig = configFile >> "CfgWeapons" >> _weapon;
_pistolConfig = configFile >> "CfgWeapons" >> _kind;
	
_return = false;
while {isClass _unknownConfig} do
{
	if (_unknownConfig == _pistolConfig) exitWith
	{
		_return = true; 
	};
	 _unknownConfig = inheritsFrom _unknownConfig;
};

_return; 
