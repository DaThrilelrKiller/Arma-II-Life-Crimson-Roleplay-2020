// Open police report dialog
createDialog "cdb_policeReport";

// Initialize warrant request toggle
cdb_warrantRequested = false;
ctrlSetText [5011, "Request Warrant: NO"];
ctrlEnable [5012, false];
ctrlEnable [5006, false];

// Pre-fill suspect name if available
if (!isNil "cdb_object" && !isNull cdb_object && cdb_object isKindOf "Man") then {
	ctrlSetText [5001, name cdb_object];
};

// Populate online players list (convenience; still saved by UID on server)
private ["_idx","_selUID","_u"];
lbClear 5014;
_idx = lbAdd [5014, "-- Select online player --"];
lbSetData [5014, _idx, ""];

_selUID = "";
if (!isNil "cdb_object" && !isNull cdb_object && cdb_object isKindOf "Man") then {
	_selUID = getPlayerUID cdb_object;
};

{
	_u = getPlayerUID _x;
	if (_u != "") then {
		_idx = lbAdd [5014, name _x];
		lbSetData [5014, _idx, _u];
		if (_selUID != "" && {_u == _selUID}) then {
			lbSetCurSel [5014, _idx];
		};
	};
} forEach playableUnits;
