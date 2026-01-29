private ["_item","_infos","_preisOhneTax","_preis","_name","_type","_index","_sort","_class","_itemIndex","_stock"];

lbClear 301;
_sort = lbText [2101, (lbCurSel 2101)];
_itemIndex = 0;

{
	_item         = _x;
	if (typeName _item == "STRING") then {
		_infos        = _item call config_array;
		if (typeName _infos == "ARRAY" && {count _infos != 0})then {
			_preisOhneTax = _infos call config_buycost;
			if (isNil "_preisOhneTax" || {typeName _preisOhneTax != "SCALAR"}) then {
				_preisOhneTax = 0;
			};
			_preis        = _infos call INV_getitemSteuer;
			if (isNil "_preis" || {typeName _preis != "SCALAR"}) then {
				_preis = _preisOhneTax;
			};
			_name         = (_infos call config_displayname);
			if (isNil "_name" || {typeName _name != "STRING"}) then {
				_name = _item;
			};
			_type = toLower (_infos call config_type);
			if (isNil "_type" || {typeName _type != "STRING"}) then {
				_type = "item";
			};
			
			_stock = if (!isNil "shop_object" && {!isNull shop_object}) then {
				[shop_object, _itemIndex] call shops_getStock
			} else {
				0
			};
			
			if (_sort == "All" || {_type == _sort})then {
			
			switch(_type)do
			{
				case "item":
				{
					_index = lbAdd [301, format ["%1 ($%2, %3kg, Stock: %4)", _name, (_preis), (_infos call config_weight), _stock] ]; 
					lbSetPicture [301, _index,format ["data\images\items\%1.paa",[_item]call config_image]];				
				};
				case "label":
				{
					_index = lbAdd [301, format ["%1", _name] ];
				};
				case "vehicle":
				{
					_index = lbAdd [301, format ["%1 ($%2, Stock: %3)", _name, (_preis), _stock] ];
					_class = _x call config_class;
					_image = getText (configFile >> "CfgVehicles" >> _class >> "Picture");
					lbSetPicture [301, _index, _image];
				};
				case "weapon":
				{
					_index = lbAdd [301, format ["%1 ($%2, Stock: %3)", _name, (_preis), _stock] ];
					_class = _x call config_class;
					_image = getText (configFile >> "CfgWeapons" >> _class >> "Picture");
					lbSetPicture [301, _index, _image];
				};
				case "magazin":
				{
					_index = lbAdd [301, format ["%1 ($%2, Stock: %3)", _name, (_preis), _stock] ];
					_class = _x call config_class;
					_image = getText (configFile >> "CfgMagazines" >> _class >> "Picture");
					lbSetPicture [301, _index, _image];
				};
				default 
				{
					_index = lbAdd [301, format ["%1 ($%2, Stock: %3)", _name, (_preis), _stock] ];
				};
			};
			
			lbSetData [301, _index, format ["%1", [_item,_infos, _preisOhneTax, _preis]] ];		

			};
		};
		_itemIndex = _itemIndex + 1;
	};
	true
}count _this;