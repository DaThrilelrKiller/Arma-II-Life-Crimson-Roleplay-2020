private ["_type","_muzzles"];

_type = _this;
_muzzles = getArray(configFile >> "cfgWeapons" >> _type >> "muzzles");
		
if (count _muzzles > 1) then
{
	player selectWeapon (_muzzles select 0);
}
else
{
	player selectWeapon _type;
};
