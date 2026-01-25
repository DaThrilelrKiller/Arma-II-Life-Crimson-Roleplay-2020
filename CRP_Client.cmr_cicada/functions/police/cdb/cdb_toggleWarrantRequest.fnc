// Toggle warrant request checkbox
if (isNil "cdb_warrantRequested") then {
	cdb_warrantRequested = false;
};

cdb_warrantRequested = !cdb_warrantRequested;

if (cdb_warrantRequested) then {
	ctrlSetText [5011, "Request Warrant: YES"];
	ctrlEnable [5012, true];
	ctrlEnable [5006, true];
} else {
	ctrlSetText [5011, "Request Warrant: NO"];
	ctrlEnable [5012, false];
	ctrlEnable [5006, false];
};
