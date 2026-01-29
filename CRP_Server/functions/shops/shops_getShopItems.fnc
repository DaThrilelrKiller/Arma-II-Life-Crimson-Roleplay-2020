private ["_shop","_shopData","_categories","_shopItems","_category","_buyItems"];

_shop = if (typeName _this == "ARRAY" && {count _this > 0}) then {
	_this select 0
} else {
	_this
};

_shopData = _shop getVariable ["shop_data", []];
if (count _shopData == 0) exitWith {
	[]
};

_categories = _shopData select 2;
_shopItems = [];

{
	_category = _x;
	if (count _category >= 3) then {
		_buyItems = _category select 1;
		if (typeName _buyItems == "ARRAY") then {
			{
				if (typeName _x == "STRING") then {
					_shopItems set [count _shopItems, _x];
				};
			}forEach _buyItems;
		};
	};
}forEach _categories;

_shopItems
