// Calculate dynamic price based on stock level
private ["_basePrice","_currentStock","_maxStock","_stockPercent","_multiplier","_adjustedPrice"];

_basePrice = _this select 0;
_currentStock = _this select 1;
_maxStock = _this select 2;

// Calculate stock percentage
_stockPercent = if (_maxStock > 0) then {
	(_currentStock / _maxStock) * 100
} else {
	0
};

// Apply price multiplier based on stock level
// Low stock (0-25%): +50% price
// Medium stock (25-75%): Normal price
// High stock (75-100%): -25% price
if (_stockPercent <= 25) then {
	_multiplier = 1.5; // Low stock = higher price
} else {
	if (_stockPercent <= 75) then {
		_multiplier = 1.0; // Medium stock = normal price
	} else {
		_multiplier = 0.75; // High stock = lower price
	};
};

_adjustedPrice = _basePrice * _multiplier;
_adjustedPrice = round _adjustedPrice;

_adjustedPrice
