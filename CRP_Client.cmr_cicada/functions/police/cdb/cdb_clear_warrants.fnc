private ["_target","_uid"];
_target = _this;
_uid = "";

if ((typeName _target) == "OBJECT") then {
	if (!isNull _target) then { _uid = getPlayerUID _target; };
};
if ((typeName _target) == "STRING") then {
	_uid = _target;
};

if (_uid == "") exitWith { systemChat "No valid suspect selected."; };

// Persist clear by UID (works online/offline; updates player var if online)
["SERVER", [_uid], "S_Cdb_clearWarrantsUID", false, false] call network_MPExec;
systemChat "Warrants cleared (saved).";