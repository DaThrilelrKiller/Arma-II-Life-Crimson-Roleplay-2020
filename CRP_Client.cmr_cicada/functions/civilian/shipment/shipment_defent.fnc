
shipment_defend_time = time + 90;
["true","Weapon Shipment","Defend The Shipment For 1:30 Minutes!"]call Main_Notification;

while {true} do {

	if !(alive player)exitWith{
		["true","Weapon Shipment","You Failed The Mission!"]call Main_Notification;
		[shipment_vehicle,shipment_item,-1]call storage_add;
	};

	if (shipment_vehicle distance getMarkerPos Shipment_destination > 20)exitWith {
		["true","Weapon Shipment","Mission Failed, You Drove To Far Away!"]call Main_Notification;
		[shipment_vehicle,shipment_item,-1]call storage_add;
	};
	
	if (time > shipment_defend_time)exitWith
	{
		["true","Weapon Shipment","Your Shipment Was Successfully Delivered!"]call Main_Notification;
		call shipment_payout;
	};
};