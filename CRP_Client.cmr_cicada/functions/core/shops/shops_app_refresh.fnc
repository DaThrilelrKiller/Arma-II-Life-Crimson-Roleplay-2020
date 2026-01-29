// Refresh shops app data from server
private ["_display","_listbox"];

_display = findDisplay 113;
if (isNull _display) exitWith {};

_listbox = _display displayCtrl 3000;
lbClear _listbox;

// Show loading message
lbAdd [_listbox, "Loading stock data from server..."];

// Request data from server
["SERVER", [player], "shops_getAllStock", false, false] call network_MPExec;

true
