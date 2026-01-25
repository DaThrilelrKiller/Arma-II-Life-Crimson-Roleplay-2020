// Init for reports list dialog: hide approve/deny for non-judges
private ["_isJudge"];
_isJudge = call court_isJudge;

// 6010 = Approve, 6011 = Deny
ctrlShow [6010, _isJudge];
ctrlShow [6011, _isJudge];

true

