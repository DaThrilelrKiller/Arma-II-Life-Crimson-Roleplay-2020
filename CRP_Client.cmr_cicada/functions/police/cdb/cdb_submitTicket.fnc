// Submit a ticket (new persisted ticket system)
private ["_suspectText","_amountText","_reason","_amount","_suspect","_uid","_sel","_uidFromCombo"];

_suspectText = ctrlText 7202;
_amountText = ctrlText 7204;
_reason = ctrlText 7206;

_sel = lbCurSel 7210;
_uidFromCombo = "";
if (_sel >= 0) then { _uidFromCombo = lbData [7210, _sel]; };

if ((_suspectText == "" && {_uidFromCombo == ""}) || _reason == "") exitWith {
	systemChat "Fill in suspect and reason.";
};

if !(_amountText call storage_isNumber) exitWith {
	systemChat "Amount must be a number.";
};

_amount = parseNumber _amountText;
if (_amount <= 0) exitWith { systemChat "Amount must be greater than 0."; };

// Prefer online selection (stores UID in lbData), otherwise fall back to typed Name/UID
if (_uidFromCombo != "") then {
	_uid = _uidFromCombo;
} else {
// Resolve UID (online name -> UID, or typed UID)
	_suspect = objNull;
	{
		if (name _x == _suspectText) exitWith { _suspect = _x; };
	} forEach playableUnits;

	_uid = if (isNull _suspect) then {_suspectText} else {getPlayerUID _suspect};
};
if (_uid == "") exitWith { systemChat "Invalid suspect."; };

["SERVER", [_uid, _reason, _amount, name player, getPlayerUID player], "S_Court_addTicket", false, false] call network_MPExec;

systemChat "Ticket issued (saved to database).";
closeDialog 0;

