// Refresh shops app data from server
private ["_display"];

_display = findDisplay 113;
if (isNull _display) exitWith {
	systemChat "Shop app dialog not found";
	diag_log text "[SHOPS APP] Cannot refresh - dialog not open";
	false
};

// Use control ID directly (like shops_selllist does)
lbClear 3000;

// Show loading message
lbAdd [3000, "Loading stock data from server..."];
lbAdd [3000, "Please wait..."];

diag_log text "[SHOPS APP] Requesting stock data from server";

// Request data from server - the callback will update the display
["SERVER", [player], "shops_getAllStock", false, false] call network_MPExec;

// Also try to display immediately in case we have cached data
if (!isNil "shops_app_stockData" && {count shops_app_stockData > 0}) then {
	diag_log formatText ["[SHOPS APP] Using cached data: %1 entries", count shops_app_stockData];
	call shops_app_display;
} else {
	diag_log text "[SHOPS APP] No cached data, waiting for server response";
};

true
