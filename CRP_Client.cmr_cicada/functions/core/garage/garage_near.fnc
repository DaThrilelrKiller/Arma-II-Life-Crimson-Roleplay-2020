private ["_return"];

_return = {
	if (player distance getPos _x < 5)exitWith {true};
	false
}forEach DTK_Garage_Array;

_return