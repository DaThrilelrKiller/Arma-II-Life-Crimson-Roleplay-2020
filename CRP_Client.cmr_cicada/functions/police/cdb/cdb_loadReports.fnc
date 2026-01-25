// Load reports into listbox
private ["_listbox","_report","_timestamp","_officer","_suspect","_type","_status","_timeStr","_index"];
_listbox = 6001;
lbClear _listbox;

if (isNil "cdb_policeReports" || count cdb_policeReports == 0) then {
	lbAdd [_listbox, "No reports found"];
} else {
	{
		_report = _x;
		_timestamp = _report select 0;
		_officer = _report select 1;
		_suspect = _report select 3;
		_type = _report select 5;
		_status = _report select 10;
		
		_timeStr = [_timestamp / 3600, "HH:MM"] call BIS_fnc_timeToString;
		_index = lbAdd [_listbox, format["[%1] %2 - %3 (%4)", _timeStr, _suspect, _type, _status]];
		lbSetData [_listbox, _index, str _forEachIndex];
	} forEach cdb_policeReports;
};

lbSetCurSel [_listbox, 0];
