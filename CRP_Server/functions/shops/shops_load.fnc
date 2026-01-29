// Load shop stock data from shops.ini
private ["_shopVarName","_item","_count","_loadedCount"];

shops_stockData = [];
_loadedCount = 0;

// Note: We can't enumerate all sections/keys in iniDBI easily
// So we'll load stock data on-demand when shops_getStock is called
// This function initializes the array

diag_log text "[SHOPS] Shop stock load function ready - stock will be loaded on-demand";

true
