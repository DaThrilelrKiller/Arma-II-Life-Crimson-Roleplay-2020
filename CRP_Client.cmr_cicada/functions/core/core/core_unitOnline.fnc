
{
	if (_this in [getPlayerUid _x,name _x,_x,format ["%1's House",name _x]])exitWith {true};
	false
}forEach playableUnits;