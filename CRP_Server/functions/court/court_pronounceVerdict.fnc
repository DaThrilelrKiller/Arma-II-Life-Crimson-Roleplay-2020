// Judge pronounces verdict
private ["_verdict","_sentence","_fine","_caseID","_defendantUID","_defendant","_money","_bank","_total"];
if (!(call court_isJudge)) exitWith {
	systemChat "You are not authorized to pronounce verdicts.";
};

if (!court_sessionActive) exitWith {
	systemChat "No court session is active.";
};

if (player != court_currentJudge) exitWith {
	systemChat "You are not the presiding judge for this case.";
};

_verdict = _this select 0; // "guilty" or "not_guilty"
_sentence = parseNumber (_this select 1); // minutes
_fine = parseNumber (_this select 2); // amount

_caseID = court_currentCase select 0;
_defendantUID = court_currentCase select 4;

// Find defendant by UID
_defendant = objNull;
{
	if (getPlayerUID _x == _defendantUID) then {
		_defendant = _x;
	};
} forEach playableUnits;

// Update case on server
["ALL", [_caseID, ["completed", name player, getPlayerUID player, _sentence, _fine]], "court_updateCase", false, false] call network_MPExec;

// Apply sentence
if (_verdict == "guilty") then {
	if (_sentence > 0) then {
		// Send to jail - jail_handler expects [_unit, _cop, _time] where time is in minutes
		["ALL", [_defendant, [player, _sentence], "jail_handler", true, false], "network_MPExec", false, false] call network_MPExec;
		// Also broadcast the arrest message
		["ALL", ["dtk_client", format["%1 was sentenced to %2 minute(s) in jail by Judge %3", name _defendant, _sentence, name player], 1], "network_chat", false, true] call network_MPExec;
	};
	
	if (_fine > 0) then {
		// Apply fine
		_money = [_defendant, "geld"] call storage_amount;
		_bank = _defendant getVariable ["dtk_bank", 0];
		_total = _money + _bank;
		
		if (_total >= _fine) then {
			_money = if (_fine >= _money) then {_money} else {_fine};
			_bank = _fine - _money;
			[_defendant, 'geld', -(_money)] call storage_add;
			_defendant setVariable ["dtk_bank", _bank, true];
		};
	};
	
	["ALL", [format["Case #%1: VERDICT - GUILTY. Sentence: %2 minutes, Fine: $%3", _caseID, _sentence, _fine]], "network_chat", false, true] call network_MPExec;
} else {
	["ALL", [format["Case #%1: VERDICT - NOT GUILTY. Defendant is free to go.", _caseID]], "network_chat", false, true] call network_MPExec;
};

// End session
court_sessionActive = false;
court_currentJudge = objNull;
court_currentDefendant = objNull;
court_currentPlaintiff = objNull;
court_currentCase = [];

closeDialog 0;
