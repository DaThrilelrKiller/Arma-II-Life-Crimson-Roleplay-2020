// Initialize shop stock system on server
diag_log text "[SHOPS] Shop stock system initialized";

// Register network handlers for client calls (assign compiled functions to global variables)
shops_addStock = S_shops_addStockHandler;
shops_getAdjustedPrice = S_shops_getAdjustedPriceHandler;
shops_getAllStock = S_shops_getAllStockHandler;

// Load all shop stock data from database and set variables on shop objects
// Note: This must be called after INV_ItemShops is loaded (which happens in pre_init)
[] spawn {
	// Wait a moment to ensure INV_ItemShops is loaded
	sleep 1;
	[] call S_shops_load;
	diag_log text "[SHOPS] Shop stock system fully initialized with shop object variables";
};
