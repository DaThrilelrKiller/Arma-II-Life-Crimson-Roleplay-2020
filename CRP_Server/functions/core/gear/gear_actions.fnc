
{
	_x addaction ["Open Gear","noscript.sqf", format ["[%1]call gear_open",_x], 1, false, true,"Gear"];
}forEach allMissionObjects "Infostand_2_EP1";