private ["_VclVar","_UID","_index"];
createDialog "schluessel";
{
	if ([player,_x]call keys_has) then 
	{ 
		_index = lbAdd [1, format ["%1 (%2)", typeOf _x, _x]];
		lbSetData [1, _index, format ["%1", _x]];
	};
}count (allMissionObjects "AllVehicles");

buttonSetAction [5,"call keys_give;"];
