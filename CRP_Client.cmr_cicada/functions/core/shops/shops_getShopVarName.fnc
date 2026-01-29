private ["_shopObject","_shopVarName"];

_shopObject = _this select 0;

_shopVarName = vehicleVarName _shopObject;

if (_shopVarName == "") then {
	_shopVarName = format["Shop_Unknown_%1", _shopObject];
};

_shopVarName
