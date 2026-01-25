private ["_vehicle","_weight","_maxweight","_show"];
createDialog "itemkaufdialog";
_vehicle = _this select 0;
dtk_active_storage = _vehicle;

_show = if (_vehicle isKindof "Man")then {false}else{true};

[1,_vehicle,_show]call storage_toDialog;
[101,player,false]call storage_toDialog;

_weight = [_vehicle]call storage_kg;
_maxweight = [_vehicle] call storage_maxkg;
CtrlSetText [765,format ["Storage: %1/%2", _weight, _maxweight]];
CtrlSettext [3,  "Take"];
CtrlSettext [103,  "Drop"];
CtrlSetText [91,localize "STRS_inv_fabrik_dialogheader1"];
CtrlSetText [92,localize "STRS_inv_fabrik_dialogheader2"];


buttonSetAction [3,  format ['
if ((lbCurSel 1) >= 0) then {
	[dtk_active_storage,player,(call compile(lbData [1, (lbCurSel 1)]) select 0),ctrlText 2]call storage_move;
};
',_vehicle]];


buttonSetAction [103,  format['
if ((lbCurSel 101) >= 0) then {
	[player,dtk_active_storage,(call compile(lbData [101, (lbCurSel 101)]) select 0),ctrlText 102]call storage_move;
};
',_vehicle]];