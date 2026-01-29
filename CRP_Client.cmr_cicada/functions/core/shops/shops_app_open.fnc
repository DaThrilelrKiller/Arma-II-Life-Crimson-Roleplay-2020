// Open shops demand/inventory app
if (!createDialog "shops_app_menu") then {
	systemChat "Failed to open Shop Demand & Inventory app";
	diag_log text "[SHOPS APP] Failed to create dialog";
} else {
	diag_log text "[SHOPS APP] Dialog opened successfully";
	
	// Initialize sort mode
	if (isNil "shops_app_sortMode") then {
		shops_app_sortMode = "demand";
	};
	
	// Clear and show initial message using control ID directly
	lbClear 3000;
	lbAdd [3000, "Shop Demand & Inventory"];
	lbAdd [3000, "────────────────────────────"];
	lbAdd [3000, "Loading stock data..."];
	
	// Refresh data
	call shops_app_refresh;
};

true
