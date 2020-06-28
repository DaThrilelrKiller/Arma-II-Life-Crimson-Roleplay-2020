if (call garage_near && {(vehicle player != player)})exitWith
{
	if (driver(vehicle player) == player)then {
		[ (dtkgarage call shops_index)]call shops_open;
	};
	true
};