private ["_shopObject","_shopVarName"];

_shopObject = _this select 0;

_shopVarName = vehicleVarName _shopObject;

if (_shopVarName == "") then {
	private ["_shopIndex"];
	_shopIndex = _shopObject getVariable ["shop_data", -1];
	
	if (_shopIndex >= 0) then {
		_shopVarName = format["Shop_%1", _shopIndex];
	} else {
		_shopVarName = format["Shop_Unknown_%1", _shopObject];
	};
};

_shopVarName
