private ["_gangs","_index"];

/* grabs list of all gangs */
_gangs = gangs getVariable ["Names",[]];

/* create list of all gangs in a listbox */
{
	_index = lbAdd [2,_x];
	lbSetData [2, _index,_x];	
}forEach _gangs;