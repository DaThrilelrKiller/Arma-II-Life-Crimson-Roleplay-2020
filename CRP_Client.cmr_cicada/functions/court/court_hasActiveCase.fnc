// Check if player has an active case
private _hasCase = false;
private _playerUID = getPlayerUID player;

{
	private _case = _x;
	private _defendantUID = _case select 4;
	private _status = _case select 6;
	
	if ((_defendantUID == _playerUID) && (_status == "pending" || _status == "scheduled" || _status == "in_session")) then {
		_hasCase = true;
	};
} forEach court_cases;

_hasCase
