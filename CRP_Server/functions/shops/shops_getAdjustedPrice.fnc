// Get adjusted price for a shop/item combination
private ["_shopVarName","_item","_basePrice","_currentStock","_adjustedPrice"];

_shopVarName = _this select 0;
_item = _this select 1;
_basePrice = _this select 2;

// Get current stock
_currentStock = [_shopVarName, _item] call S_shops_getStock;

// Calculate adjusted price
_adjustedPrice = [_basePrice, _currentStock, shops_maxStock] call S_shops_calculatePrice;

_adjustedPrice
