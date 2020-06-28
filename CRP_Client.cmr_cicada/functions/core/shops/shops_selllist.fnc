private ["_magazines","_item","_infos","_preisOhneTax","_preis","_name","_type","_calssname","_index","_mags","_vehicle","_vclClass","_j","_weps","_sort","_vehicles"];

lbClear 301;
_sort = lbText [2101, (lbCurSel 2101)];
_vehicles = nearestObjects [getPos player, ["Motorcycle","car","Truck", "Ship", "LandVehicle"], 10];
_magazines = (magazines player);


{
_item = _x;
_infos  = _item call config_array;

if (count _infos != 0)then {
_preisOhneTax = (_infos call config_sellcost)*0.5;
_preis        = (_infos call INV_getitemSteuer)*0.5;
_name         = (_infos call config_displayname);
_type = _infos call config_type;
_calssname = _infos call config_class;

	if (_sort == "All" || {_type == _sort})then {

	switch(_type)do
	{
		case "weapon":
		{
			if (player hasweapon _calssname) then 
			{																																																																
				_index = lbAdd [301, format["%1 ($%2)", _name, _preis] ];						
				lbSetData [301, _index, format ['%1',[_item,_infos,_preisOhneTax, _preis]]];						
			};
		};
		case "magazin":
		{
			if (_calssname in _magazines) then 
			{																																						
				_mags      = {_x == _calssname} count magazines player;	
				_index = lbAdd [301, format["%1 ($%2 %3x)", _name, (_preis call string_intToString), (_mags call string_intToString)] ];																	
				lbSetData [301, _index, format ['%1',[_item,_infos,_preisOhneTax, _preis]]];	
			};
		};
		case "Item":
		{
			if ( (([player,_item] call storage_amount) > 0) and (_item call config_dropable) ) then
			{
				_index = lbAdd [301, format["%1 ($%2, %5kg, %4x)", _name, (_preis call string_intToString),0,([player,_item] call storage_amount),(_infos call config_weight)] ];																																							
				lbSetData [301, _index, format ['%1',[_item,_infos,_preisOhneTax, _preis]]];		
			};	

		};
		case "vehicle":
		{
				{
					_vehicle = _x;
					_vclClass = (_vehicle getVariable "DTK_OwnerUID" select 1);
					if (!isNil "_vclClass")then 
					{
						if (_vclClass == _item and [player,_vehicle]call keys_has) then 
						{			
							_index = lbAdd [301, format["%1 ($%2, %3)", _vehicle, (_preis call string_intToString), _name] ];															
							lbSetData [301, _index, format ['%1',[_item,_infos,_preisOhneTax, _preis,[_vehicle]]]];	
						};	
					};
				}forEach _vehicles;
		};
		case "siren":
		{
				
				_vehicle = (vehicle player);
				_sirens = _vehicle getVariable ["dtk_sirens",[]];				
				if (_item in _sirens and [player,_vehicle]call keys_has) then 
				{			
					_index = lbAdd [301, format["%1 ($%2, %3)", _vehicle, (_preis call string_intToString), _name] ];															
					lbSetData [301, _index, format ['%1',[_item,_infos,_preisOhneTax, _preis,[_vehicle]]]];	
				};	
		};
		case "App":
		{
			if (_item in INVAppsInstalled)then {
				_index = lbAdd [301, format["%1 ($%2)", _name, (_preis call string_intToString)] ];																																							
				lbSetData [301, _index, format ['%1',[_item,_infos,_preisOhneTax, _preis]]];

			};			
		};
	};
	};
	};
	true
}count _this;