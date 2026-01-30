private ["_basePrice","_stock","_maxStock","_multiplier","_stockPercent"];

_basePrice = _this select 0;
_stock = _this select 1;
_maxStock = if (count _this > 2) then {_this select 2} else {1000};

if (_maxStock <= 0) then {
    _maxStock = 1000;
};

_stockPercent = _stock / _maxStock;
if (_stockPercent > 1) then {
    _stockPercent = 1;
};
if (_stockPercent < 0) then {
    _stockPercent = 0;
};

_multiplier = 1.3 - (_stockPercent * 0.5);

_basePrice * _multiplier;