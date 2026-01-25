// Load reports into listbox
private _listbox = 6001;
lbClear _listbox;

if (isNil "cdb_policeReports" || count cdb_policeReports == 0) then {
	lbAdd [_listbox, "No reports found"];
} else {
	{
		private _report = _x;
		private _timestamp = _report select 0;
		private _officer = _report select 1;
		private _suspect = _report select 3;
		private _type = _report select 5;
		private _status = _report select 10;
		
		private _timeStr = [_timestamp / 3600, "HH:MM"] call BIS_fnc_timeToString;
		private _index = lbAdd [_listbox, format["[%1] %2 - %3 (%4)", _timeStr, _suspect, _type, _status]];
		lbSetData [_listbox, _index, str _forEachIndex];
	} forEach cdb_policeReports;
};

lbSetCurSel [_listbox, 0];
