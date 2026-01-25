
_return = [];

{
	if ([player,_x]call keys_has)then {
		_return set [count _return,_x];
	};
}forEach allMissionObjects "AllVehicles";

_return