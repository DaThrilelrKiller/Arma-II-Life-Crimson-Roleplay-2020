diag_log text "[SHOPS] Shop stock system initialized";

shops_addStock = S_shops_addStockHandler;
shops_getAdjustedPrice = S_shops_getAdjustedPriceHandler;
shops_getAllStock = S_shops_getAllStockHandler;

[] spawn {
	sleep 1;
	[] call S_shops_load;
	diag_log text "[SHOPS] Shop stock system fully initialized with shop object variables";
};
