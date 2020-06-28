
_location = (lbData [1500, (lbCurSel 1500)]);
_item = (lbData [1501, (lbCurSel 1501)]);
_vehicle = call compile (lbData [2100, (lbCurSel 2100)]);

if (!isNil "_vehicle" && {!isNull _vehicle})then
{
	if (_vehicle distance player > 20)exitWith {
	systemchat "The vehicle you selected is to far away";
	};

	if ([_vehicle,_item, 1] call storage_add)then
	{
		shipment_vehicle = _vehicle;
		shipment_road_time = 0;
		shipment_offroad_time = 0;
		shipment_police_distance_1 = 100000000;
		Shipment_destination = _location;
		shipment_item = _item;
		shipment_wp =(group player) addWaypoint [getMarkerPos _location, 0];
		(group player) setCurrentWaypoint  shipment_wp;
		shipment_wp setWaypointDescription "Weapon Drop Off!";

		systemchat format ["You have taken a %1 shipment deliver it to %2",lbText [1501, (lbCurSel 1501)],lbText [1500,(lbCurSel 1500)]];
		[]spawn shipment_handler;
	}
	else{
		systemchat "Your vehicle does not have enough storage to transport the shipment!";
	};
}else{
systemchat "Please select the vehicle you would like to make the shipment with!";
};