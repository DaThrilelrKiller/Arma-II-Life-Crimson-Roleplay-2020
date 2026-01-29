
{
	if (side _x == west) then {
		if (shipment_vehicle distance _x < shipment_police_distance_1)then
		{
		shipment_police_distance_1 = shipment_vehicle distance _x;
		};
	};
}count playableUnits;