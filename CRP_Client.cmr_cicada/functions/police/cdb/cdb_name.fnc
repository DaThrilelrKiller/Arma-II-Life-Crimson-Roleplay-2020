private ["_return"];
if (isPlayer _this && (vehicle _this != _this))then
{
	_return = name _this;
}else
{
	_return = getText(configFile >> "CfgVehicles" >> (typeOf _this) >> "displayname");
};

_return