// Load report types into combo box
private _combo = 5003;
lbClear _combo;

private _types = ["Traffic Violation", "Assault", "Theft", "Drug Offense", "Weapons Violation", "Other"];

{
	lbAdd [_combo, _x];
} forEach _types;

lbSetCurSel [_combo, 0];
