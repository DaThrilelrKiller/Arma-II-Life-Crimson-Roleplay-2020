private ["_item","_infos","_preisOhneTax","_preis","_name","_type","_index","_sort","_class","_shopVarName","_categoryIndex","_adjustedPrice","_basePrice"];

lbClear 301;
_sort = lbText [2101, (lbCurSel 2101)];

// Get shop info for dynamic pricing
_shopVarName = "";
_categoryIndex = -1;
if (!isNil "shop_object" && {!isNull shop_object}) then {
	_shopVarName = [shop_object] call shops_getShopVarName;
	_categoryIndex = if (isNil "shop_categoryIndex") then {-1} else {shop_categoryIndex};
};

{
	_item         = _x;
	_infos        = _item call config_array;
	if (count _infos != 0)then {
		_preisOhneTax = _infos call config_buycost;
		_basePrice = _preisOhneTax;
		
		// Get adjusted price based on stock if we have shop info
		if (_shopVarName != "" && {_categoryIndex >= 0}) then {
			_adjustedPrice = ["SERVER", [_shopVarName, _categoryIndex, _item, _basePrice], "shops_getAdjustedPrice", false, false] call network_MPExec;
			if (!isNil "_adjustedPrice" && {typeName _adjustedPrice == "SCALAR"}) then {
				_preisOhneTax = _adjustedPrice;
			};
		};
		
		_preis        = _preisOhneTax call INV_getitemSteuer;
		_name         = (_infos call config_displayname);
		_type = toLower (_infos call config_type);
		
		if (_sort == "All" || {_type == _sort})then {
		
		switch(_type)do
		{
			case "item":
			{
				_index = lbAdd [301, format ["%1 ($%2, %3kg)", _name, (_preis), (_infos call config_weight)] ]; 
				lbSetPicture [301, _index,format ["data\images\items\%1.paa",[_item]call config_image]];				
			};
			case "label":
			{
				_index = lbAdd [301, format ["%1", _name] ];
			};
			case "vehicle":
			{
				_index = lbAdd [301, format ["%1 ($%2)", _name, (_preis)] ];
				_class = _x call config_class;
				_image = getText (configFile >> "CfgVehicles" >> _class >> "Picture");
				lbSetPicture [301, _index, _image];
			};
			case "weapon":
			{
				_index = lbAdd [301, format ["%1 ($%2)", _name, (_preis)] ];
				_class = _x call config_class;
				_image = getText (configFile >> "CfgWeapons" >> _class >> "Picture");
				lbSetPicture [301, _index, _image];
			};
			case "magazin":
			{
				_index = lbAdd [301, format ["%1 ($%2)", _name, (_preis)] ];
				_class = _x call config_class;
				_image = getText (configFile >> "CfgMagazines" >> _class >> "Picture");
				lbSetPicture [301, _index, _image];
			};
			default 
			{
				_index = lbAdd [301, format ["%1 ($%2)", _name, (_preis)] ];
			};
		};
		
		lbSetData [301, _index, format ["%1", [_item,_infos, _preisOhneTax, _preis]] ];		

		};
	};
	true
}count _this;