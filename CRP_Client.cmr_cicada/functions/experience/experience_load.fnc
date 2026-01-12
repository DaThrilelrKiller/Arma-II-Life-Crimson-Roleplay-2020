
DTK_civTime = _this select 0;
DTK_unTime = _this select 1;
DTK_pdTime = _this select 2;
_todayTime = _this select 3;
_last7Days = _this select 4;
DTK_JoinTime = time;

systemchat format ["30 Day Time Log Report: CIV: %1 FIRE: %2 PD: %3 ",[DTK_civTime/60/60,1]call BIS_fnc_cutDecimals,[DTK_unTime/60/60,1]call BIS_fnc_cutDecimals,[DTK_pdTime/60/60,1]call BIS_fnc_cutDecimals];
systemchat format ["7 Day Time Report: CIV: %1 FIRE: %2 PD: %3 ",[(_last7Days select 0)/60/60,1]call BIS_fnc_cutDecimals,[(_last7Days select 1)/60/60,1]call BIS_fnc_cutDecimals,[(_last7Days select 2)/60/60,1]call BIS_fnc_cutDecimals];
systemchat format ["Todays Time Report: CIV: %1 FIRE: %2 PD: %3 ",[(_todayTime select 0)/60/60,1]call BIS_fnc_cutDecimals,[(_todayTime select 1)/60/60,1]call BIS_fnc_cutDecimals,[(_todayTime select 2)/60/60,1]call BIS_fnc_cutDecimals];

/* Playtime-based whitelisting */
private ["_whitelistEntry","_playtimeParams","_requiredHours","_periodType","_timeType","_playerTime","_requiredSeconds","_whitelistVar"];
{
	_whitelistEntry = _x;
	_playtimeParams = if (count _whitelistEntry > 3) then {_whitelistEntry select 3} else {[]};
	
	/* Check if this entry has playtime requirements */
	if (count _playtimeParams == 3) then {
		_requiredHours = _playtimeParams select 0;
		_periodType = _playtimeParams select 1; /* 7 for 7-day, 30 for 30-day */
		_timeType = _playtimeParams select 2; /* "CIV", "UN", or "PD" */
		
		/* Check if player's current side matches the required side for this role */
		/* Civs cannot be whitelisted for EMS roles */
		if (dtk_side == _timeType) then {
			/* Convert required hours to seconds */
			_requiredSeconds = _requiredHours * 60 * 60;
			
			/* Get player's playtime based on period type and time type */
			if (_periodType == 7) then {
				/* Use 7-day totals */
				switch (_timeType) do {
					case "CIV": {_playerTime = _last7Days select 0;};
					case "UN": {_playerTime = _last7Days select 1;};
					case "PD": {_playerTime = _last7Days select 2;};
					default {_playerTime = 0;};
				};
			} else {
				/* Use 30-day totals */
				switch (_timeType) do {
					case "CIV": {_playerTime = DTK_civTime;};
					case "UN": {_playerTime = DTK_unTime;};
					case "PD": {_playerTime = DTK_pdTime;};
					default {_playerTime = 0;};
				};
			};
			
			/* Check if player meets requirement and set whitelist variable */
			if (_playerTime >= _requiredSeconds) then {
				_whitelistVar = _whitelistEntry select 1;
				missionNamespace setVariable [_whitelistVar, true];
				systemchat format ["Auto-whitelisted for %1 (Playtime requirement met: %2h %3-day %4)", _whitelistEntry select 0, _requiredHours, _periodType, _timeType];
			};
		};
	};
} forEach whitelist_data;