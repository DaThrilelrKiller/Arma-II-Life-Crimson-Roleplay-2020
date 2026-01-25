// Sync court cases to client
private _player = _this select 0;

["ALL", [court_cases, _player], "court_receiveCases", false, false] call network_MPExec;

true
