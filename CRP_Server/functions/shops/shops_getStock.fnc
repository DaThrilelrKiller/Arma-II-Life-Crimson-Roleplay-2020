// Get current stock for a shop/item combination from shop object variable
private ["_shopVarName","_item","_shop","_inv","_stock"];

_shopVarName = _this select 0;
_item = _this select 1;

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
	diag_log formatText ["[SHOPS] Shop not found for varName: %1", _shopVarName];
	_stock = 0;
} else {
	// Get inventory from shop object variable
	_inv = _shop getVariable ["shop_inventory", []];
	_stock = 0;
	
	// Find item in inventory
	{
		if ((_x select 0) == _item) exitWith {
			_stock = _x select 1;
		};
	}forEach _inv;
};

_stock
