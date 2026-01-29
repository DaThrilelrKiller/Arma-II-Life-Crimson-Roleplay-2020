// Initialize shop stock system on server
diag_log text "[SHOPS] Shop stock system initialized";

// Register network handler for client calls
shops_addStock = {
	private ["_params","_shopVarName","_item","_amount"];
	_params = _this;
	if (count _params >= 3) then {
		_shopVarName = _params select 0;
		_item = _params select 1;
		_amount = _params select 2;
		[_shopVarName, _item, _amount] call S_shops_addStock;
	};
	true
};

// Register network handler for getting adjusted price
shops_getAdjustedPrice = {
	private ["_params","_shopVarName","_item","_basePrice","_adjustedPrice"];
	_params = _this;
	_shopVarName = _params select 0;
	_item = _params select 1;
	_basePrice = _params select 2;
	_adjustedPrice = [_shopVarName, _item, _basePrice] call S_shops_getAdjustedPrice;
	_adjustedPrice
};

// Register network handler for getting all stock data
shops_getAllStock = {
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
};

// Load all shop stock data from database and set variables on shop objects
// Note: This must be called after INV_ItemShops is loaded (which happens in pre_init)
[] spawn {
	// Wait a moment to ensure INV_ItemShops is loaded
	sleep 1;
	[] call S_shops_load;
	diag_log text "[SHOPS] Shop stock system fully initialized with shop object variables";
};
