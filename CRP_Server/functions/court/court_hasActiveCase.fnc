// Check if player has an active case
private ["_hasCase","_playerUID","_case","_defendantUID","_status"];
_hasCase = false;
_playerUID = getPlayerUID player;

{
	_case = _x;
	_defendantUID = _case select 4;
	_status = _case select 6;
	
	if ((_defendantUID == _playerUID) && (_status == "pending" || _status == "scheduled" || _status == "in_session")) then {
		_hasCase = true;
	};
} forEach court_cases;

_hasCase
