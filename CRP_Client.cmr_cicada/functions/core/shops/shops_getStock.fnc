private ["_shopObject","_varName","_stockVarName","_stockArray","_itemIndex","_stock"];

_shopObject = _this select 0;
_itemIndex = _this select 1;
_categoryIndex = if (count _this > 2) then {_this select 2} else {if (!isNil "shop_categoryIndex") then {shop_categoryIndex} else {0}};

if (isNil "_shopObject" || {isNull _shopObject}) exitWith {0};

_varName = vehicleVarName _shopObject;
if (_varName == "") then {
    _varName = format["Shop_Unknown_%1", _shopObject];
};

_stockVarName = format["%1_%2_Stock",_varName,_categoryIndex];
_stockArray = _shopObject getVariable[_stockVarName,[]];

if (_itemIndex < count _stockArray) then {
    _stock = _stockArray select _itemIndex;
    if (isNil "_stock" || {typeName _stock != "SCALAR"}) then {
        0
    } else {
        _stock
    };
} else {
    0
};