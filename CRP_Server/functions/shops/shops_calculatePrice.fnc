private ["_basePrice","_currentStock","_maxStock","_stockPercent","_multiplier","_adjustedPrice"];

_basePrice = _this select 0;
_currentStock = _this select 1;
_maxStock = _this select 2;

_stockPercent = if (_maxStock > 0) then {
	(_currentStock / _maxStock) * 100
} else {
	0
};

if (_stockPercent <= 25) then {
	_multiplier = 1.5;
} else {
	if (_stockPercent <= 75) then {
		_multiplier = 1.0;
	} else {
		_multiplier = 0.75;
	};
};

_adjustedPrice = _basePrice * _multiplier;
_adjustedPrice = round _adjustedPrice;

_adjustedPrice
