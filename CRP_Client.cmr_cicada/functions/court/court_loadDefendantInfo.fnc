// Load defendant hearing information
if (count court_currentCase == 0) exitWith {};

private _caseID = court_currentCase select 0;
private _plaintiffName = court_currentCase select 1;
private _charges = court_currentCase select 5;

ctrlSetText [4001, format["Case #%1\nPlaintiff: %2\nCharges: %3\n\nYour case is being heard. Please wait for the judge's verdict.", _caseID, _plaintiffName, _charges]];
