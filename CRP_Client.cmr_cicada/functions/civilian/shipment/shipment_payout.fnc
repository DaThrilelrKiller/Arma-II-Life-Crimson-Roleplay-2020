
_normal = shipment_item call config_sellcost;
_totaltime = shipment_road_time + shipment_offroad_time;
[shipment_vehicle,shipment_item,-1]call storage_add;
_dec = [shipment_offroad_time,1]select (shipment_offroad_time < 1);
_penalty = _normal * parseNumber format ['0.%1',_dec];
_money = _normal - _penalty;
_money = [_money,0]select (_money < 0);

"Payout" hintC 
[
	format ["Normal Sell Price: %1",_normal], 
	format ["Total Time: %1",_totaltime], 
	format ["On Road Time: %1",shipment_road_time], 
	format ["Off-Road Time: %1",shipment_offroad_time], 
	format ["Off Road Penalty: -%1",_penalty], 
	format ["Nearest Police: %1m",shipment_police_distance_1], 
	format ["Total Payout: %1",_money]
];

[player,"geld",_money]call storage_add;
