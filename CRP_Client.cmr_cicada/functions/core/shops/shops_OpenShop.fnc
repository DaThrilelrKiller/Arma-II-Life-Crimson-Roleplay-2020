private ["_shoparray","_con","_shopData","_categories","_selectedIndex"];

if (count _this < 1)then {
	_selectedIndex = lbCurSel 897;
	_shoparray = call compile(lbData [897, _selectedIndex]);
	
	// Find category index
	if (!isNil "shop_object") then {
		_shopData = shop_object getVariable ["shop_data", []];
		if (count _shopData >= 3) then {
			_categories = _shopData select 2;
			if (_selectedIndex >= 0 && {_selectedIndex < count _categories}) then {
				shop_categoryIndex = _selectedIndex;
			};
		};
	};
}else{
	_shoparray = _this select 0;
	// If directly called, assume category 0
	shop_categoryIndex = 0;
};

if (isNil "_shoparray")exitWith {
	systemChat "You are not whitelisted for the shop";
};

shop_cache = _shoparray;

shop_buylist   = if (typeName (_shoparray select 1) == "STRING")then{call call compile(_shoparray select 1)}else{(_shoparray select 1)};
shop_selllist   = if (typeName (_shoparray select 2) == "STRING")then{call call compile(_shoparray select 2)}else{(_shoparray select 2)};
_con =  (_shoparray select 3);

if !(_con call shops_canuseshop)exitWith {systemChat "you are not allowed to use this shop";};

createDialog "shopping";

call shops_types;
lbAdd [2100,"Shop"];
lbAdd [2100,"Inventoy"];
lbSetCurSel [2100,0];
