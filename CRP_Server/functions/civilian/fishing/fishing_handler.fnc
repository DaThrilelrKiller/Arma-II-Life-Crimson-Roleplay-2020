if(([player,"fishing_rod"] call storage_amount) < 1)exitWith {
	v_fishing = false;
	{(_x select 0) removeAction (_x select 1)}forEach a_fishing;
	false
};

if !(surfaceIsWater getPos player)exitWith {
false
};

true

