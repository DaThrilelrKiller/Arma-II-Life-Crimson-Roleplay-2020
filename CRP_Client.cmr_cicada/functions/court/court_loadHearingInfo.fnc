// Load hearing information into dialog
if (count court_currentCase == 0) exitWith {};

private _caseID = court_currentCase select 0;
private _plaintiffName = court_currentCase select 1;
private _defendantName = court_currentCase select 3;
private _charges = court_currentCase select 5;
private _description = if (count court_currentCase > 12) then { court_currentCase select 12 } else { "No description provided." };

ctrlSetText [3001, format["Case #%1\nPlaintiff: %2\nDefendant: %3\nCharges: %4\n\nDescription: %5", _caseID, _plaintiffName, _defendantName, _charges, _description]];
