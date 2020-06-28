private ["_cursel","_data","_bools","_key","_shift","_ctrl","_alt","_letter"];

_data = profileNamespace getVariable lbText [1401, (lbCurSel 1401)];
_data = [_data,"_"] call string_split;

_key = _data select 2;
_shift = call compile (_data select 3);
_ctrl = call compile (_data select 4);
_alt = call compile (_data select 5);

if (isNil "_shift")then {
	_shift = false;
	_ctrl = false;
	_alt = false;
};

lbSetCurSel [2100, (_key call keypress_index)];

if (_shift) then {lbSetCurSel [2101, 0];}else{lbSetCurSel [2101, 1];};
if (_ctrl) then {lbSetCurSel [2102, 0];}else{lbSetCurSel [2102, 1];};
if (_alt) then {lbSetCurSel [2103, 0];}else{lbSetCurSel [2103, 1];};