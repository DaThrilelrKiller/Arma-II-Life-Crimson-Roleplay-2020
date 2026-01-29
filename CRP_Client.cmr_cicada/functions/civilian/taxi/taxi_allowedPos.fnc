


{
	if ((_x select 0) distance _this < _x select 1)exitWith {
		true
	};
	false
}forEAch taxi_blacklist;