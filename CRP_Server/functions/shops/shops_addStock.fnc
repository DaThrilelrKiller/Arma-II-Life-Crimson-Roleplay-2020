private ["_shopVarName","_item","_amount","_shop","_shopIndex","_shopItems","_currentStock","_newStock","_inv","_itemIndex","_found","_result"];

_shop = _this select 0;
_item = _this select 1;
_amount = _this select 2;

_shopVarName = vehicleVarName _shop;

if (!(_item in shops_playerItems)) exitWith {
	false
};

_shopIndex = _shop getVariable ["shop_data", -1];
_shopItems = [_shopIndex] call S_shops_getShopItems;

if (!(_item in _shopItems)) exitWith {
	diag_log formatText ["[SHOPS] Shop %1 (index %2) does not sell item %3. Shop sells %4 items total. Skipping stock update.", _shopVarName, _shopIndex, _item, count _shopItems];
	false
};

_currentStock = [_shopVarName, _item] call S_shops_getStock;

_newStock = _currentStock + _amount;
if (_newStock > shops_maxStock) then {
	_newStock = shops_maxStock;
};
if (_newStock < 0) then {
	_newStock = 0;
};

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

_shop setVariable ["shop_needsSave", true, true];

diag_log formatText ["[SHOPS] Updated %1 %2 in %3. New stock: %4 (marked for save)", _amount, _item, _shopVarName, _newStock];

diag_log text "[SHOPS] Triggering save event...";
_result = [] call S_shops_saveAll;
if (_result) then {
	diag_log text "[SHOPS] Save event completed successfully";
} else {
	diag_log text "[SHOPS] Save event returned false - check logs above";
};

true
