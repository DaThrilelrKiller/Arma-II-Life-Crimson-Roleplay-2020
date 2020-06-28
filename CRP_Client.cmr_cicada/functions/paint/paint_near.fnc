private ["_return"];
_return = {
	if (player distance getPos _x < 5)exitWith {true};
	false
}forEach dtk_paint_shops;

if (player != driver (vehicle player)) exitWith {false};
_return