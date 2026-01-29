// Add inventory when player sells item - updates shop object variable
// Only adds stock if shop actually sells this item
private ["_shopVarName","_item","_amount","_shop","_shopIndex","_shopItems","_currentStock","_newStock","_inv","_itemIndex","_found"];

_shopVarName = _this select 0;
_item = _this select 1;
_amount = _this select 2;

// Check if item is player-obtainable
if (!(_item in shops_playerItems)) exitWith {
	false
};

// Find shop object by variable name using vehicleVarName
_shop = objNull;
_shopIndex = -1;
if (!isNil "INV_ItemShops") then {
	{
		private ["_s","_varName"];
		_s = _x select 0;
		if (!isNull _s) then {
			_varName = vehicleVarName _s;
			// If vehicleVarName is empty, use index-based fallback
			if (_varName == "") then {
				_varName = format["Shop_%1", _forEachIndex];
			};
			// Check if this shop matches the requested varName
			if (_varName == _shopVarName) exitWith {
				_shop = _s;
				_shopIndex = _forEachIndex;
			};
		};
	}forEach INV_ItemShops;
};

if (isNull _shop || {_shopIndex < 0}) then {
	diag_log formatText ["[SHOPS] ERROR: Shop not found for varName: %1", _shopVarName];
	false
} else {
	// Check if shop actually sells this item
	_shopItems = [_shopIndex] call S_shops_getShopItems;
	if (!(_item in _shopItems)) exitWith {
		diag_log formatText ["[SHOPS] Shop %1 does not sell item %2, skipping stock update", _shopVarName, _item];
		false
	};
	
	// Shop sells this item, proceed with stock update
	// Get current stock from shop object variable
	_currentStock = [_shopVarName, _item] call S_shops_getStock;
	
	// Calculate new stock (cap at maxStock, floor at 0)
	_newStock = _currentStock + _amount;
	if (_newStock > shops_maxStock) then {
		_newStock = shops_maxStock;
	};
	if (_newStock < 0) then {
		_newStock = 0;
	};
	
	// Update shop object variable
	_inv = _shop getVariable ["shop_inventory", []];
	_itemIndex = -1;
	_found = false;
	
	{
		if ((_x select 0) == _item) exitWith {
			_itemIndex = _forEachIndex;
			_found = true;
		};
	}forEach _inv;
	
	if (_found) then {
		_inv set [_itemIndex, [_item, _newStock]];
	} else {
		_inv set [count _inv, [_item, _newStock]];
	};
	
	_shop setVariable ["shop_inventory", _inv, true];
	
	// Mark shop as needing save and trigger save event
	_shop setVariable ["shop_needsSave", true, true];
	
	diag_log formatText ["[SHOPS] Updated %1 %2 in %3. New stock: %4 (marked for save)", _amount, _item, _shopVarName, _newStock];
	
	// Trigger save event immediately (call directly instead of spawn for reliability)
	diag_log text "[SHOPS] Triggering save event...";
	_result = [] call S_shops_saveAll;
	if (_result) then {
		diag_log text "[SHOPS] Save event completed successfully";
	} else {
		diag_log text "[SHOPS] Save event returned false - check logs above";
	};
	
	true
}
