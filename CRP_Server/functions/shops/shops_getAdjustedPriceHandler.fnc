private ["_params","_shopVarName","_categoryIndex","_item","_basePrice","_adjustedPrice","_shop","_shopData","_categories","_category","_buyItems"];

_params = _this;
_shopVarName = _params select 0;
_categoryIndex = _params select 1;
_item = _params select 2;
_basePrice = _params select 3;

// If category index not provided or invalid, try to find it
if (_categoryIndex < 0) then {
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
	
	if (!isNull _shop) then {
		_shopData = _shop getVariable ["shop_data", []];
		if (count _shopData >= 3) then {
			_categories = _shopData select 2;
			{
				_category = _x;
				if (count _category >= 2) then {
					_buyItems = _category select 1;
					if (typeName _buyItems == "ARRAY" && {_item in _buyItems}) exitWith {
						_categoryIndex = _forEachIndex;
					};
				};
			}forEach _categories;
		};
	};
};

if (_categoryIndex >= 0) then {
	_adjustedPrice = [_shopVarName, _categoryIndex, _item, _basePrice] call S_shops_getAdjustedPrice;
} else {
	// Fallback to base price if category not found
	_adjustedPrice = _basePrice;
};

_adjustedPrice
