private [
    "_side","_uid","_player",
    "_year","_month","_day",
    "_civTime","_unTime","_pdTime",
    "_civ7","_un7","_pd7",
    "_todayTime","_last7Time",
    "_count","_d","_m","_y",
    "_todayCiv","_todayUn","_todayPd",
    "_daysInMonth"
];

_side   = _this select 1;
_player = _this select 0;
_uid    = getPlayerUID _player;

_year  = date select 0;
_month = date select 1;
_day   = date select 2;

/* Totals */
_civTime = 0;   // 31 days
_unTime  = 0;
_pdTime  = 0;

_civ7 = 0;      // 7 days
_un7  = 0;
_pd7  = 0;

_todayTime = [0,0,0];
_last7Time = [0,0,0];

_count = 0;
_d = _day;
_m = _month;
_y = _year;

while {_count < 31} do {

    /* Read DAILY values */
    _todayCiv = ([format["Timelog - %1",_uid],_m,format["time_CIV_%1_%2",_y,_d],0] call s_stats_read) max 0;
    _todayUn  = ([format["Timelog - %1",_uid],_m,format["time_UN_%1_%2", _y,_d],0] call s_stats_read) max 0;
    _todayPd  = ([format["Timelog - %1",_uid],_m,format["time_PD_%1_%2", _y,_d],0] call s_stats_read) max 0;

    /* TODAY only */
    if (_count == 0) then {
        _todayTime = [_todayCiv,_todayUn,_todayPd];
    };

    /* LAST 7 DAYS */
    if (_count < 7) then {
        _civ7 = _civ7 + _todayCiv;
        _un7  = _un7  + _todayUn;
        _pd7  = _pd7  + _todayPd;
    };

    /* LAST 31 DAYS */
    _civTime = _civTime + _todayCiv;
    _unTime  = _unTime  + _todayUn;
    _pdTime  = _pdTime  + _todayPd;

    _count = _count + 1;
    _d = _d - 1;

    /* Month rollover */
    if (_d < 1) then {

        _m = _m - 1;
        if (_m < 1) then {
            _m = 12;
            _y = _y - 1;
        };

        _daysInMonth = switch (_m) do {
            case 1;
            case 3;
            case 5;
            case 7;
            case 8;
            case 10;
            case 12: {31};
            case 4;
            case 6;
            case 9;
            case 11: {30};
            case 2: {
                if ((_y mod 4 == 0 && _y mod 100 != 0) || (_y mod 400 == 0)) then {29} else {28};
            };
        };

        _d = _daysInMonth;
    };
};

/* Pack last-7 */
_last7Time = [_civ7,_un7,_pd7];

/* Send result */
[
    _player,
    [
        _civTime,     
        _unTime,
        _pdTime,
        _todayTime,    
        _last7Time     
    ],
    "experience_load",
    false,
    false
] call network_MPExec;
