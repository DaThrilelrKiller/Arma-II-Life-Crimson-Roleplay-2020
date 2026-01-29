// Get list of items that a shop sells (items it buys from players)
// Parameters: shopIndex
// Returns: array of item classnames
private ["_shopIndex","_shopData","_categories","_shopItems","_category","_buyItems"];

_shopIndex = _this;

if (isNil "INV_ItemShops" || {_shopIndex < 0} || {_shopIndex >= count INV_ItemShops}) exitWith {
	[]
};

_shopData = INV_ItemShops select _shopIndex;
_categories = _shopData select 2;
_shopItems = [];

// Iterate through shop categories
{
	_category = _x;
	// Category format: [["categoryName", "displayName"], buyItemsArray, sellItemsArray, condition, vehicleSpawn, isIllegal]
	if (count _category >= 3) then {
		_buyItems = _category select 1; // Items shop buys from players (what we track stock for)
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
