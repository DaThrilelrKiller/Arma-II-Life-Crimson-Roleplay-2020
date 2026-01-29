// Load shop stock data from shops.ini
private ["_allShops","_shopVarName","_item","_count","_stockKey","_stockValue"];

shops_stockData = [];

// Get all shop variable names from INV_ItemShops (this will be populated on server)
// For now, we'll load stock data when shops are accessed
// The actual loading happens per-shop when needed

diag_log text "[SHOPS] Shop stock load function ready";

true
