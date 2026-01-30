private ["_shopObject","_varName","_stockVarName","_stockArray","_itemIndex","_amount","_categoryIndex","_currentStock","_newStock"];

_shopObject = _this select 0;
_itemIndex = _this select 1;
_amount = _this select 2;
_categoryIndex = if (count _this > 3) then {_this select 3} else {if (!isNil "shop_categoryIndex") then {shop_categoryIndex} else {0}};

if (isNil "_shopObject" || {isNull _shopObject}) exitWith {false};
if (isNil "_itemIndex" || {typeName _itemIndex != "SCALAR"}) exitWith {false};
if (isNil "_amount" || {typeName _amount != "SCALAR"}) exitWith {false};

_varName = vehicleVarName _shopObject;
if (_varName == "") then {
    _varName = format["Shop_Unknown_%1", _shopObject];
};

_stockVarName = format["%1_%2_Stock",_varName,_categoryIndex];
_stockArray = _shopObject getVariable[_stockVarName,[]];

// Ensure the array is large enough
while {count _stockArray <= _itemIndex} do {
    _stockArray set [count _stockArray, 0];
};

_currentStock = _stockArray select _itemIndex;
if (isNil "_currentStock" || {typeName _currentStock != "SCALAR"}) then {
    _currentStock = 0;
};

_newStock = _currentStock + _amount;
// Prevent negative stock
if (_newStock < 0) then {
    _newStock = 0;
};

_stockArray set [_itemIndex, _newStock];
_shopObject setVariable[_stockVarName, _stockArray, true];

true
