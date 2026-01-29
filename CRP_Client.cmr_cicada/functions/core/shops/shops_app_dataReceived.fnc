// Callback when stock data is received from server
private ["_stockData"];

_stockData = _this;
shops_app_stockData = _stockData;

// Refresh display
call shops_app_display;

true
