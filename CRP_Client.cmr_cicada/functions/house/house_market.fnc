createDialog "house_dealer";
lnbAddRow [1501,["Name","Doors Size","Price"]];

{
	_marker = format["house_%1",_ForEachINdex];
	_owned = [_marker] call house_owned;
	
	_type = typeof _x;
	_name = getText(configFile >> "CfgVehicles" >> typeOf _x >> "DisplayName");
	_doors = count ([_x] call house_doors);
	_price = _type call house_price;
	_size = round (SizeOf _type);
	
	if !(_owned)then {
		_row = lnbAddRow [1501,[_name,str _doors + format["     %1",_size],format["%1$",[_price] call Main_FormatMoney]]];
		lnbSetData [1501, [_row, 0],str[_marker,_price]];
	}else{
		if ([_marker]call house_own)then {
				_row = lnbAddRow [1501,[_name,str _doors + format["     %1",_size],format["%1$",[_price] call Main_FormatMoney]]];
				lnbSetData [1501, [_row, 0],str[_marker,_price]];
		};
	};
}forEach dtk_house_list;