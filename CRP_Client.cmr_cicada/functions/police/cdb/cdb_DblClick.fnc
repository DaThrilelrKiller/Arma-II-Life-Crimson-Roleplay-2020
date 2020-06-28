
_contol = _this select 0;
_selected = _this select 1;
_data = _contol lbData _selected;

if (_data != "")then {
	ctrlSetText [1,_data];
	[_data] call cdb_search;
};