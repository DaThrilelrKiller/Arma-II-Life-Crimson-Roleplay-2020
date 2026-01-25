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
