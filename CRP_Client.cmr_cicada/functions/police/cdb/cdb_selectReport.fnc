// Select a report from list
private ["_listbox","_selected","_reportIndex","_report","_timestamp","_officer","_suspect","_type","_details","_warrantRequested","_warrantReason","_warrantAmount","_status","_timeStr"];
_listbox = 6001;
_selected = lbCurSel _listbox;

if (_selected == -1) exitWith {};

_reportIndex = parseNumber (lbData [_listbox, _selected]);

if (isNil "cdb_policeReports" || _reportIndex >= count cdb_policeReports) exitWith {};

_report = cdb_policeReports select _reportIndex;

// Display report details
_timestamp = _report select 0;
_officer = _report select 1;
_suspect = _report select 3;
_type = _report select 5;
_details = _report select 6;
_warrantRequested = _report select 7;
_warrantReason = _report select 8;
_warrantAmount = _report select 9;
_status = _report select 10;

_timeStr = [_timestamp / 3600, "HH:MM"] call BIS_fnc_timeToString;

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
