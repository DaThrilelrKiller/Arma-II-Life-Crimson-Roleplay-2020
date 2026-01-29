createdialog 'shipment_open';

{
	_name = markerText _x;
	_distance = player distance getMarkerPos _x;
	_index = lbAdd [1500, format["%1 (%2m)",_name,_distance]];
	lbSetData [1500, _index, _x];	
}count Shipment_locations;

{
	_name = (_x call config_displayname);
	_index = lbAdd [1501, _name];
	lbSetData [1501, _index, _x];	
}count Shipment_items;

{

	if ([player,_x]call keys_has && {player distance _x < 25}) then 
	{ 
		_index = lbAdd [2100, format ["%1 (%2)", typeOf _x, _x]];
		lbSetData [2100, _index, format ["%1", _x]];
	};
}forEach nearestObjects [getPos player, ["Motorcycle","car","Truck", "Ship", "LandVehicle"], 10];

[]spawn Shipment_update_map;