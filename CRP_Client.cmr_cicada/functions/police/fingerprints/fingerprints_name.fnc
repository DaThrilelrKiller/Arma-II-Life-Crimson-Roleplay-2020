_type = typeOf _this;
_weapons = getWeaponCargo _this;
_magizines = getMagazineCargo _this; 

if (_type != "weaponholder")exitWith {
	getText(configFile >> "CfgVehicles" >> _type >> "displayname");
};
if (count (_weapons select 0) >0)exitWith {
	getText(configFile >> "CfgWeapons" >> (_weapons select 0 select 0) >> "displayname");
};
if (count (_magizines select 0) >0)exitWith {
	getText(configFile >> "CfgMagazines" >> (_magizines select 0 select 0) >> "displayname");
};
