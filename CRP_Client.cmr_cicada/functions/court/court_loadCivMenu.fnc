// Populate the civilian court services menu
private ["_disp","_lbTickets","_lbCases","_lbWarrants","_uid","_tickets","_cases","_warrants"];

_disp = findDisplay 7100;
if (isNull _disp) exitWith {};

_lbTickets = 7101;
_lbCases = 7102;
_lbWarrants = 7103;

lbClear _lbTickets;
lbClear _lbCases;
lbClear _lbWarrants;

_uid = getPlayerUID player;

// ------------------
// Tickets (unpaid)
// Ticket format: [timestamp, officerName, officerUID, reason, amount, status]
// ------------------
_tickets = if (isNil "court_myTickets") then {[]} else {court_myTickets};
if ((typeName _tickets) != "ARRAY") then {_tickets = [];};

if (count _tickets == 0) then {
	lbAdd [_lbTickets, "Tickets: None"];
} else {
	{
		private ["_t","_ts","_officer","_reason","_amount","_status","_timeStr","_idx"];
		_t = _x;
		if ((typeName _t) == "ARRAY" && {count _t >= 6}) then {
			_ts = _t select 0;
			_officer = _t select 1;
			_reason = _t select 3;
			_amount = _t select 4;
			_status = _t select 5;

			if (_status == "unpaid") then {
				_timeStr = [_ts / 3600, "HH:MM"] call BIS_fnc_timeToString;
				_idx = lbAdd [_lbTickets, format["[%1] $%2 - %3 (By %4)", _timeStr, [_amount] call main_formatMoney, _reason, _officer]];
				lbSetData [_lbTickets, _idx, str _forEachIndex];
			};
		};
	} forEach _tickets;

	if ((lbSize _lbTickets) == 0) then {
		lbAdd [_lbTickets, "Tickets: None"];
	};
};

// ------------------
// Court Dates / Cases (your cases only)
// Case structure: [caseID, plaintiffName, plaintiffUID, defendantName, defendantUID, charges, status, judgeName, judgeUID, sentence, fine, filedTime, description]
// ------------------
_cases = if (isNil "court_cases") then {[]} else {court_cases};
if ((typeName _cases) != "ARRAY") then {_cases = [];};

private ["_foundCase"];
_foundCase = false;
{
	private ["_c","_caseID","_defUID","_charges","_status","_filed","_timeStr"];
	_c = _x;
	if ((typeName _c) == "ARRAY" && {count _c >= 12}) then {
		_defUID = _c select 4;
		if (_defUID == _uid) then {
			_foundCase = true;
			_caseID = _c select 0;
			_charges = _c select 5;
			_status = _c select 6;
			_filed = _c select 11;
			_timeStr = [_filed / 3600, "HH:MM"] call BIS_fnc_timeToString;
			lbAdd [_lbCases, format["Case #%1 [%2] (%3) - %4", _caseID, _status, _timeStr, _charges]];
		};
	};
} forEach _cases;

if (!_foundCase) then {
	lbAdd [_lbCases, "Court Dates: None"];
};

// ------------------
// Warrants (your warrants)
// Warrant format: [reason, amount]
// ------------------
_warrants = player getVariable ["cdb_warrants", []];
if ((typeName _warrants) != "ARRAY") then {_warrants = [];};

if (count _warrants == 0) then {
	lbAdd [_lbWarrants, "Warrants: None"];
} else {
	{
		private ["_w","_reason","_amount"];
		_w = _x;
		if ((typeName _w) == "ARRAY" && {count _w >= 2}) then {
			_reason = _w select 0;
			_amount = _w select 1;
			lbAdd [_lbWarrants, format["Warrant: %1 ($%2)", _reason, [_amount] call main_formatMoney]];
		};
	} forEach _warrants;
};

