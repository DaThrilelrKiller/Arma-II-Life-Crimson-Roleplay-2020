// Add inventory when player sells item - updates shop object variable
private ["_shopVarName","_item","_amount","_shop","_currentStock","_newStock","_inv","_itemIndex","_found"];

_shopVarName = _this select 0;
_item = _this select 1;
_amount = _this select 2;

if (!(_item in shops_playerItems)) exitWith {
	false
};

// Find shop object by variable name
_shop = objNull;
if (!isNil "INV_ItemShops") then {
	{
		private ["_s","_varName"];
		_s = _x select 0;
		if (!isNull _s) then {
			_varName = format["Shop_%1", _forEachIndex];
			if (_varName == _shopVarName) exitWith {
				_shop = _s;
			};
		};
	}forEach INV_ItemShops;
};

if (isNull _shop) then {
	diag_log formatText ["[SHOPS] ERROR: Shop not found for varName: %1", _shopVarName];
	false
} else {
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
	
	// Trigger save event (save immediately)
	[] spawn {
		sleep 0.1; // Small delay to batch multiple changes
		[] call S_shops_saveAll;
	};
	
	diag_log formatText ["[SHOPS] Updated %1 %2 in %3. New stock: %4 (saved to variable, save event triggered)", _amount, _item, _shopVarName, _newStock];
	
	true
}
