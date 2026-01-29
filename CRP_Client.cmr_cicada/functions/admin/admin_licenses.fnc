createDialog "admin_licenses";
admin_selected = 5;
[2100, true] call dtk_PlayerListToControl;
call admin_load;

{
	_index = lbAdd [1501,(_x select 2)];
	lbSetData [1501, _index, (_x select 0)];
}count dtk_licenses;


[]spawn admin_licenses_handler;