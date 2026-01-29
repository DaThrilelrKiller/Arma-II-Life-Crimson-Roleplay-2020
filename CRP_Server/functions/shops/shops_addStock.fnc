// Add inventory when player sells item
private ["_shopVarName","_item","_amount","_currentStock","_newStock","_index"];

_shopVarName = _this select 0;
_item = _this select 1;
_amount = _this select 2;

if (!(_item in shops_playerItems)) exitWith {
	false
};

// Get current stock
_currentStock = [_shopVarName, _item] call S_shops_getStock;

// Calculate new stock (cap at maxStock, floor at 0)
_newStock = _currentStock + _amount;
if (_newStock > shops_maxStock) then {
	_newStock = shops_maxStock;
};
if (_newStock < 0) then {
	_newStock = 0;
};

// Find or create stock entry
_index = -1;
{
	if ((_x select 0) == _shopVarName && (_x select 1) == _item) exitWith {
		_index = _forEachIndex;
	};
}forEach shops_stockData;

if (_index == -1) then {
	// Create new entry
	shops_stockData set [count shops_stockData, [_shopVarName, _item, _newStock]];
	_index = count shops_stockData - 1;
} else {
	// Update existing entry
	(shops_stockData select _index) set [2, _newStock];
};

// Save to database
[_shopVarName, _item, _newStock] call S_shops_saveStock;

diag_log formatText ["[SHOPS] Added %1 %2 to %3. New stock: %4", _amount, _item, _shopVarName, _newStock];

true
