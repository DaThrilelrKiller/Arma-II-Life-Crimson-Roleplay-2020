// Get shop variable name from shop_object
private ["_shopObject","_shopVarName"];

_shopObject = _this select 0;

// Get shop variable name from shop object (set in shops_init.fnc)
_shopVarName = _shopObject getVariable ["shop_varName", ""];

if (_shopVarName == "") then {
	// Fallback: try to get from shop_data index
	private ["_shopIndex"];
	_shopIndex = _shopObject getVariable ["shop_data", -1];
	
	if (_shopIndex >= 0) then {
		_shopVarName = format["Shop_%1", _shopIndex];
		_shopObject setVariable ["shop_varName", _shopVarName, true];
	} else {
		// Last resort fallback
		_shopVarName = format["Shop_Unknown_%1", _shopObject];
		_shopObject setVariable ["shop_varName", _shopVarName, true];
	};
};

_shopVarName
