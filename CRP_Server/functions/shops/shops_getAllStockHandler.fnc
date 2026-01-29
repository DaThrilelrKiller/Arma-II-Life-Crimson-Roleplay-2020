// Network handler for getting all stock data
private ["_params","_player","_stockData"];

_params = _this;
if (count _params > 0) then {
	_player = _params select 0;
	_stockData = [] call S_shops_getAllStock;
	diag_log formatText ["[SHOPS] Sending %1 stock entries to player %2", count _stockData, name _player];
	// Send data back to requesting player
	[_player, _stockData, "shops_app_dataReceived", false, false] call network_MPExec;
} else {
	diag_log text "[SHOPS] shops_getAllStock called without player parameter";
};

true
