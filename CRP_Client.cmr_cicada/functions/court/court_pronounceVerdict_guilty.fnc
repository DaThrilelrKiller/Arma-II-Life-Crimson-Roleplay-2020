// Pronounce guilty verdict with sentence and fine
private _sentenceCtrl = _this select 0;
private _fineCtrl = _this select 1;

private _sentence = parseNumber (ctrlText _sentenceCtrl);
private _fine = parseNumber (ctrlText _fineCtrl);

["guilty", _sentence, _fine] call court_pronounceVerdict;
