
{
	if (([getPlayerUID _x, name _x, _x, format ["%1's House", name _x]] find _this) > -1)exitWith {true};
	false
}forEach playableUnits;