// Open shops demand/inventory app
private ["_result","_display"];

_result = createDialog "shops_app_menu";
if (!_result) then {
	systemChat "Failed to open Shop Demand & Inventory app";
	diag_log text "[SHOPS APP] Failed to create dialog - createDialog returned false";
} else {
	diag_log text "[SHOPS APP] Dialog opened successfully";
	
	// Initialize sort mode
	if (isNil "shops_app_sortMode") then {
		shops_app_sortMode = "demand";
	};
	
	// Wait a frame for dialog to fully initialize, then populate listbox
	[] spawn {
		sleep 0.05;
		
		_display = findDisplay 114;
		if (!isNull _display) then {
			// Clear and show initial message using control ID directly
			lbClear 3000;
			lbAdd [3000, "Shop Demand & Inventory"];
			lbAdd [3000, "────────────────────────────"];
			lbAdd [3000, "Loading stock data from server..."];
			lbAdd [3000, "Please wait..."];
			
			// Refresh data
			call shops_app_refresh;
		} else {
			diag_log text "[SHOPS APP] Dialog disappeared after creation";
		};
	};
};

true
