// Callback when stock data is received from server
private ["_stockData"];

// Network callbacks wrap data in an array
_stockData = if (typeName _this == "ARRAY" && {count _this > 0}) then {
	_this select 0
} else {
	_this
};

if (isNil "_stockData") then {
	_stockData = [];
};

shops_app_stockData = _stockData;

diag_log formatText ["[SHOPS APP] Received %1 stock entries from server", count _stockData];

// Refresh display if dialog is open
if (!isNull (findDisplay 113)) then {
	call shops_app_display;
} else {
	diag_log text "[SHOPS APP] Dialog not open, data cached for next open";
};

true
