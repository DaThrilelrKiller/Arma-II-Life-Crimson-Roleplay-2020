// Pronounce guilty verdict with sentence and fine
private ["_sentenceCtrl","_fineCtrl","_sentence","_fine"];
_sentenceCtrl = _this select 0;
_fineCtrl = _this select 1;

_sentence = parseNumber (ctrlText _sentenceCtrl);
_fine = parseNumber (ctrlText _fineCtrl);

["guilty", _sentence, _fine] call court_pronounceVerdict;
