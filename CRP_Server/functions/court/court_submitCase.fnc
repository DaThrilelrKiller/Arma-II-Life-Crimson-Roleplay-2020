// Submit a new court case
private ["_defendantName","_charges","_description","_defendant","_case"];
_defendantName = ctrlText 1001;
_charges = ctrlText 1003;
_description = ctrlText 1005;

if (_defendantName == "" || _charges == "") exitWith {
	systemChat "Please fill in all required fields (Defendant Name and Charges).";
};

// Find defendant player
_defendant = objNull;
{
	if (name _x == _defendantName) then {
		_defendant = _x;
	};
} forEach playableUnits;

if (isNull _defendant) exitWith {
	systemChat format ["Player '%1' not found. Make sure they are online.", _defendantName];
};

// Create case - send to server
// Case structure: [caseID, plaintiffName, plaintiffUID, defendantName, defendantUID, charges, status, judgeName, judgeUID, sentence, fine, filedTime, description]
_case = [
	-1, // caseID (server will assign)
	name player, // plaintiff name
	getPlayerUID player, // plaintiff UID
	name _defendant, // defendant name
	getPlayerUID _defendant, // defendant UID
	_charges, // charges
	"pending", // status
	"", // judge name
	"", // judge UID
	0, // sentence (minutes)
	0, // fine
	time, // filedTime
	_description // description
];

// Send to server to create case
["ALL", [_case], "court_createCase", false, false] call network_MPExec;

// Notify defendant
["ALL", [format["%1 has filed a court case against you. Charges: %2", name player, _charges], _defendant], "court_notifyDefendant", false, false] call network_MPExec;

systemChat format ["Case filed successfully against %1. Waiting for case ID...", _defendantName];
closeDialog 0;
