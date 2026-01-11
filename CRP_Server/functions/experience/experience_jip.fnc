_side = _this select 1;
_uid = getPlayerUID(_this select 0);
_player = (_this select 0);

_year = date select 0;
_month = date select 1;
_day = date select 2;
_lastMonth = _month - 1;

_civTime = 0;
_unTime = 0;
_pdTime = 0;

for "_i" from 1 to _day do { 
    _civTime = _civTime + ([format["Timelog - %1",_uid],"Time",format["time_CIV_%1_%2",_year,_month,_i],0]call s_stats_read);
    _unTime = _unTime +  ([format["Timelog - %1",_uid],"Time",format["time_UN_%1_%2",_year, _month,_i],0]call s_stats_read);
    _pdTime = _unTime + ([format["Timelog - %1",_uid],"Time",format["time_PD_%1_%2",_year, _month,_i],0]call s_stats_read);
    if (_i == _day)then {
        _todayTime = [_civTime,_unTime,_unTime];
    };
 };


 for "_i" from 15 to 31 do { 
    _civTime = _civTime + ([format["Timelog - %1",_uid],"Time",format["time_CIV_%1_%2",_year,_lastMonth,_i],0]call s_stats_read);
    _unTime = _unTime +  ([format["Timelog - %1",_uid],"Time",format["time_UN_%1_%2",_year, _lastMonth,_i],0]call s_stats_read);
    _pdTime = _pdTime + ([format["Timelog - %1",_uid],"Time",format["time_PD_%1_%2",_year, _lastMonth,_i],0]call s_stats_read);
 };

 [_player,[_civTime,_unTime,_pdTime,_todayTime],"experience_load",false,false]call network_MPExec;