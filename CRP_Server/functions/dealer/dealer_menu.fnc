createDialog "dealer_menu";

{
	if ([player,_x]call keys_has && {local _x}) then 
	{			
		_name =  getText(configFile >> "CfgVehicles" >> typeOf _x >> "displayname");
		_index = lbAdd [2, format["%2 %1", _x,_name]];															
		lbSetData [2, _index,str _x];	
	};	
}forEach nearestObjects [getPos player, ["Motorcycle","car","Truck", "Ship", "LandVehicle"], 10];