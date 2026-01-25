private ["_target","_warrant","_amount","_uid","_targetName"];

_target = _this select 0;
_warrant = _this select 1;
_amount = [0,(_this select 2)] select (count _this > 2);

_uid = "";
_targetName = "";

if ((typeName _target) == "OBJECT") then {
	if (!isNull _target) then {
		_uid = getPlayerUID _target;
		_targetName = name _target;
	};
};
if ((typeName _target) == "STRING") then {
	_uid = _target;
	_targetName = _target;
};

if (_uid == "") exitWith {
	systemChat "No valid suspect selected for warrant.";
};

// Persist warrant by UID (works for online + offline)
["SERVER", [_uid, _warrant, _amount, name player, getPlayerUID player], "S_Cdb_addWarrantUID", false, false] call network_MPExec;
systemChat format ["Warrant issued for %1", _targetName];


