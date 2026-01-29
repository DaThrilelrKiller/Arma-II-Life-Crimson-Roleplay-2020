private ["_shopVarName","_categoryIndex","_item","_shop","_inv","_categoryInv","_stock"];

_shopVarName = _this select 0;
_categoryIndex = _this select 1;
_item = _this select 2;

_shop = objNull;
if (!isNil "INV_ItemShops") then {
	{
		private ["_s","_varName"];
		_s = _x select 0;
		if (!isNull _s) then {
			_varName = vehicleVarName _s;
			
			if (_varName != "" && {_varName == _shopVarName}) exitWith {
				_shop = _s;
			};
			
			if (_varName == "" && {_shopVarName == format["Shop_%1", _forEachIndex]}) exitWith {
				_shop = _s;
			};
		};
	}forEach INV_ItemShops;
};

if (isNull _shop) then {
	diag_log formatText ["[SHOPS] Shop not found for varName: %1", _shopVarName];
	_stock = 0;
} else {
	_inv = _shop getVariable ["shop_inventory", []];
	_stock = 0;
	
	// Get category inventory
	if (_categoryIndex >= 0 && {_categoryIndex < count _inv}) then {
		_categoryInv = _inv select _categoryIndex;
		
		if (typeName _categoryInv == "ARRAY") then {
			{
				if (typeName _x == "ARRAY" && {count _x >= 2} && {(_x select 0) == _item}) exitWith {
					_stock = _x select 1;
					if (typeName _stock == "STRING") then {
						_stock = parseNumber _stock;
					};
					if (isNil "_stock" || {typeName _stock != "SCALAR"}) then {
						_stock = 0;
					};
				};
			}forEach _categoryInv;
		};
	} else {
		diag_log formatText ["[SHOPS] Invalid category index %1 for shop %2 (has %3 categories)", _categoryIndex, _shopVarName, count _inv];
	};
};

_stock
