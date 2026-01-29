// Get shop variable name from shop_object using vehicleVarName
private ["_shopObject","_shopVarName"];

_shopObject = _this select 0;

// Use vehicleVarName to get the object's variable name
_shopVarName = vehicleVarName _shopObject;

// Fallback if vehicleVarName returns empty string
if (_shopVarName == "") then {
	// Try to get from shop_data index as fallback
	private ["_shopIndex"];
	_shopIndex = _shopObject getVariable ["shop_data", -1];
	
	if (_shopIndex >= 0) then {
		_shopVarName = format["Shop_%1", _shopIndex];
	} else {
		// Last resort fallback
		_shopVarName = format["Shop_Unknown_%1", _shopObject];
	};
};

_shopVarName
