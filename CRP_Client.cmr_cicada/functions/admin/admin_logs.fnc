private ["_name","_log","_index"];
admin_selected = 7;
createDialog "admin_logs";
[2100, true] call dtk_PlayerListToControl;
call admin_load;


/* Adds lables to the collums */
_name = ["names",18]call string_setLegth;
_index = lbAdd [1501, format["%1  %2", _name,"logs"]];

/* Loads all the logs  to list box */
{	
	_name = [(_x select 0),18]call string_setLegth;
	_log = _x select 1;
	
	_index = lbAdd [1501, format["%1 %2", _name,_log]];
	lbSetData [1501, _index, format ['%1',_x]];	
	lbSetColor [1501,_index,(_x select 2)];
}count admin_logs_array;