// Check if player is a judge (admin or judge whitelist)
private _isJudge = false;

// Check if player is admin
if (SwagDevs || adminlevel4 || adminlevel3) then {
	_isJudge = true;
};

// Check if player has judge whitelist (check if variable exists first)
if (!isNil "judge_id" && {judge_id}) then {
	_isJudge = true;
};

_isJudge
