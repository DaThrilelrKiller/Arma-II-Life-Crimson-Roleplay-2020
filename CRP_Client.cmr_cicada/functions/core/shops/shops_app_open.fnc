// Open shops demand/inventory app
private ["_display","_listbox"];

if (!createDialog "shops_app_menu") then {
	systemChat "Failed to open Shop Demand & Inventory app";
	diag_log text "[SHOPS APP] Failed to create dialog";
} else {
	diag_log text "[SHOPS APP] Dialog opened successfully";
	
	_display = findDisplay 113;
	_listbox = _display displayCtrl 3000;
	
	// Initialize sort mode
	if (isNil "shops_app_sortMode") then {
		shops_app_sortMode = "demand";
	};
	
	// Clear and show initial message
	lbClear _listbox;
	lbAdd [_listbox, "Shop Demand & Inventory"];
	lbAdd [_listbox, "────────────────────────────"];
	lbAdd [_listbox, "Loading stock data..."];
	
	// Refresh data
	call shops_app_refresh;
};

true
