// Open shops demand/inventory app
createDialog "shops_app_menu";

// Initialize sort mode
if (isNil "shops_app_sortMode") then {
	shops_app_sortMode = "demand";
};

// Refresh data
call shops_app_refresh;

true
