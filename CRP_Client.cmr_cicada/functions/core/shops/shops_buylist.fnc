private ["_item","_infos","_preisOhneTax","_preis","_name","_type","_index","_sort","_class","_itemIndex","_stock","_dynamicPrice","_maxStock","_stockPercent","_color"];

lbClear 301;
_sort = lbText [2101, (lbCurSel 2101)];
_itemIndex = 0;
_maxStock = 1000;

{
	_item         = _x;
	if (typeName _item == "STRING") then {
		_infos        = _item call config_array;
		if (typeName _infos == "ARRAY" && {count _infos != 0})then {
			_preisOhneTax = _infos call config_buycost;
			if (isNil "_preisOhneTax" || {typeName _preisOhneTax != "SCALAR"}) then {
				_preisOhneTax = 0;
			};
			
			_stock = if (!isNil "shop_object" && {!isNull shop_object}) then {
				[shop_object, _itemIndex] call shops_getStock
			} else {
				0
			};
			
			_dynamicPrice = [_preisOhneTax, _stock, _maxStock, true] call shops_calculatePrice;
			_type = _infos call config_type;
			_taxPercent = _type call INV_GetObjectSteuer;
			_preis = [_dynamicPrice, _taxPercent] call INV_AddProzent;
			if (isNil "_preis" || {typeName _preis != "SCALAR"}) then {
				_preis = _dynamicPrice;
			};
			
			_name         = (_infos call config_displayname);
			if (isNil "_name" || {typeName _name != "STRING"}) then {
				_name = _item;
			};
			_type = toLower (_infos call config_type);
			if (isNil "_type" || {typeName _type != "STRING"}) then {
				_type = "item";
			};
			
			_stockPercent = (_stock / _maxStock) * 100;
			_color = if (_stockPercent <= 20) then {
				[1, 0.5, 0, 1]
			} else {
				if (_stockPercent <= 50) then {
					[1, 0.8, 0, 1]
				} else {
					nil
				}
			};
			
			if (_sort == "All" || {_type == _sort})then {
			
			switch(_type)do
			{
				case "item":
				{
					_index = lbAdd [301, format ["%1 ($%2, %3kg, Stock: %4)", _name, (_preis call string_intToString), (_infos call config_weight), _stock] ]; 
					lbSetPicture [301, _index,format ["data\images\items\%1.paa",[_item]call config_image]];
					if (!isNil "_color") then {
						lbSetColor [301, _index, _color];
					};
				};
				case "label":
				{
					_index = lbAdd [301, format ["%1", _name] ];
				};
				case "vehicle":
				{
					_index = lbAdd [301, format ["%1 ($%2, Stock: %3)", _name, (_preis call string_intToString), _stock] ];
					_class = _x call config_class;
					_image = getText (configFile >> "CfgVehicles" >> _class >> "Picture");
					lbSetPicture [301, _index, _image];
					if (!isNil "_color") then {
						lbSetColor [301, _index, _color];
					};
				};
				case "weapon":
				{
					_index = lbAdd [301, format ["%1 ($%2, Stock: %3)", _name, (_preis call string_intToString), _stock] ];
					_class = _x call config_class;
					_image = getText (configFile >> "CfgWeapons" >> _class >> "Picture");
					lbSetPicture [301, _index, _image];
					if (!isNil "_color") then {
						lbSetColor [301, _index, _color];
					};
				};
				case "magazin":
				{
					_index = lbAdd [301, format ["%1 ($%2, Stock: %3)", _name, (_preis call string_intToString), _stock] ];
					_class = _x call config_class;
					_image = getText (configFile >> "CfgMagazines" >> _class >> "Picture");
					lbSetPicture [301, _index, _image];
					if (!isNil "_color") then {
						lbSetColor [301, _index, _color];
					};
				};
				default 
				{
					_index = lbAdd [301, format ["%1 ($%2, Stock: %3)", _name, (_preis call string_intToString), _stock] ];
					if (!isNil "_color") then {
						lbSetColor [301, _index, _color];
					};
				};
			};
			
			lbSetData [301, _index, format ["%1", [_item,_infos, _preisOhneTax, _preis]] ];		

			};
		};
		_itemIndex = _itemIndex + 1;
	};
	true
}count _this;