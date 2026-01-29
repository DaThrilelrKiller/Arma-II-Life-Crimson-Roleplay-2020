private ["_shopVarName","_categoryIndex","_item","_amount","_shop","_shopIndex","_shopData","_categories","_category","_buyItems","_currentStock","_newStock","_inv","_categoryInv","_itemIndex","_found","_result"];

_shopVarName = _this select 0;
_categoryIndex = _this select 1;
_item = _this select 2;
_amount = _this select 3;

// Convert shopVarName to shop object
_shop = objNull;
_shopIndex = -1;
if (!isNil "INV_ItemShops") then {
	{
		private ["_s","_varName"];
		_s = _x select 0;
		if (!isNull _s) then {
			_varName = vehicleVarName _s;
			
			if (_varName != "" && {_varName == _shopVarName}) exitWith {
				_shop = _s;
				_shopIndex = _forEachIndex;
			};
			
			if (_varName == "" && {_shopVarName == format["Shop_%1", _forEachIndex]}) exitWith {
				_shop = _s;
				_shopIndex = _forEachIndex;
			};
		};
	}forEach INV_ItemShops;
};

if (isNull _shop) exitWith {
	diag_log formatText ["[SHOPS] Shop not found for varName: %1", _shopVarName];
	false
};

_shopData = _shop getVariable ["shop_data", []];
if (count _shopData == 0) exitWith {
	diag_log formatText ["[SHOPS] Shop %1 has no shop_data", _shopVarName];
	false
};

_categories = _shopData select 2;
if (_categoryIndex < 0 || {_categoryIndex >= count _categories}) exitWith {
	diag_log formatText ["[SHOPS] Invalid category index %1 for shop %2 (has %3 categories)", _categoryIndex, _shopVarName, count _categories];
	false
};

_category = _categories select _categoryIndex;
if (count _category < 2) exitWith {
	diag_log formatText ["[SHOPS] Category %1 in shop %2 has invalid structure", _categoryIndex, _shopVarName];
	false
};

_buyItems = _category select 1;
if (typeName _buyItems != "ARRAY" || {!(_item in _buyItems)}) exitWith {
	diag_log formatText ["[SHOPS] Item %1 not found in category %2 of shop %3", _item, _categoryIndex, _shopVarName];
	false
};

// Get current stock
_currentStock = [_shopVarName, _categoryIndex, _item] call S_shops_getStock;

_newStock = _currentStock + _amount;
if (_newStock > shops_maxStock) then {
	_newStock = shops_maxStock;
};
if (_newStock < 0) then {
	_newStock = 0;
};

// Update category-specific inventory
_inv = _shop getVariable ["shop_inventory", []];
if (_categoryIndex >= count _inv) then {
	// Initialize missing categories
	for "_i" from (count _inv) to _categoryIndex do {
		_inv set [count _inv, []];
	};
};

_categoryInv = _inv select _categoryIndex;
if (isNil "_categoryInv" || {typeName _categoryInv != "ARRAY"}) then {
	_categoryInv = [];
};

_itemIndex = -1;
_found = false;

{
	if (typeName _x == "ARRAY" && {count _x >= 2} && {(_x select 0) == _item}) exitWith {
		_itemIndex = _forEachIndex;
		_found = true;
	};
}forEach _categoryInv;

if (_found) then {
	_categoryInv set [_itemIndex, [_item, _newStock]];
} else {
	_categoryInv set [count _categoryInv, [_item, _newStock]];
};

_inv set [_categoryIndex, _categoryInv];
_shop setVariable ["shop_inventory", _inv, true];

// Mark for save if it's a player item
if (_item in shops_playerItems) then {
	_shop setVariable ["shop_needsSave", true, true];
};

diag_log formatText ["[SHOPS] Updated %1 %2 in %3 category %4. New stock: %5", _amount, _item, _shopVarName, _categoryIndex, _newStock];

true
