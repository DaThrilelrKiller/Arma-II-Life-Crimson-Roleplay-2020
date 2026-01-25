// Open new ticket issuance dialog
createDialog "cdb_ticketIssue";

// Prefill suspect if a player is selected in DB
if (!isNil "cdb_object" && {!isNull cdb_object} && {cdb_object isKindOf "Man"}) then {
	ctrlSetText [7202, name cdb_object];
};

// Populate online players list (convenience; still saved by UID on server)
private ["_idx","_selUID","_u"];
lbClear 7210;
_idx = lbAdd [7210, "-- Select online player --"];
lbSetData [7210, _idx, ""];

_selUID = "";
if (!isNil "cdb_object" && {!isNull cdb_object} && {cdb_object isKindOf "Man"}) then {
	_selUID = getPlayerUID cdb_object;
};

{
	_u = getPlayerUID _x;
	if (_u != "") then {
		_idx = lbAdd [7210, name _x];
		lbSetData [7210, _idx, _u];
		if (_selUID != "" && {_u == _selUID}) then {
			lbSetCurSel [7210, _idx];
		};
	};
} forEach playableUnits;

