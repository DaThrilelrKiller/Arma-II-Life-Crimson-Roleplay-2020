// Select a report from list
private _listbox = 6001;
private _selected = lbCurSel _listbox;

if (_selected == -1) exitWith {};

private _reportIndex = parseNumber (lbData [_listbox, _selected]);

if (isNil "cdb_policeReports" || _reportIndex >= count cdb_policeReports) exitWith {};

private _report = cdb_policeReports select _reportIndex;

// Display report details
private _timestamp = _report select 0;
private _officer = _report select 1;
private _suspect = _report select 3;
private _type = _report select 5;
private _details = _report select 6;
private _warrantRequested = _report select 7;
private _warrantReason = _report select 8;
private _warrantAmount = _report select 9;
private _status = _report select 10;

private _timeStr = [_timestamp / 3600, "HH:MM"] call BIS_fnc_timeToString;

ctrlSetText [6002, format["Report #%1", _reportIndex + 1]];
ctrlSetText [6003, format["Officer: %1", _officer]];
ctrlSetText [6004, format["Suspect: %1", _suspect]];
ctrlSetText [6005, format["Type: %1", _type]];
ctrlSetText [6006, format["Time: %1", _timeStr]];
ctrlSetText [6007, format["Status: %1", _status]];
ctrlSetText [6008, format["Details: %1", _details]];

if (_warrantRequested) then {
	ctrlSetText [6009, format["Warrant Requested: YES\nReason: %1\nAmount: $%2", _warrantReason, _warrantAmount]];
} else {
	ctrlSetText [6009, "Warrant Requested: NO"];
};
