
while {alive player} do
{
	call shipment_time;
	call shipment_police_distance;
	
	if (shipment_vehicle distance getmarkerPos Shipment_destination < 10)exitWith
	{
		call shipment_defent;
		deleteWaypoint shipment_wp;
	};

	sleep 1;
};

/* shipment failed becuse player was killed */
if !(alive player)exitWith {};