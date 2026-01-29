private ["_params","_shopVarName","_item","_basePrice","_adjustedPrice"];

_params = _this;
_shopVarName = _params select 0;
_item = _params select 1;
_basePrice = _params select 2;
_adjustedPrice = [_shopVarName, _item, _basePrice] call S_shops_getAdjustedPrice;

_adjustedPrice
