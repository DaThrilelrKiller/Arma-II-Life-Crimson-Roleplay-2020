if (dtk_server)exitWith {};

{
	(_x select 0) addaction ["","noscript.sqf",format["%1 call clothing_menu;",_x], 25, false, true, "LeanRight",format["call %1 && {!([_target,'Clothing Shop (E)','data\images\tags\Clothing']call tag_show)}",_x select 2]];
	[("Clothing_" + str _ForEachIndex),getPos (_x select 0),nil,nil,"ColorRed","mil_box",nil,format ["Clothing Shop %1",_ForEachIndex]]call core_createMarkerLocal;

}forEAch dtk_clothingshops;


private ["_name","_condition","_class","_index"];
{
	private ["_cfg","_targets","_t"];
	_cfg = _x;
	_name = (_cfg select 0);
	_class = (_cfg select 1);
	_condition = (_cfg select 2);
	_targets = (_cfg select 3);
	{
		_t = _x;
		if (!isNull _t) then {
			_t addaction [format ["Switch To %1",_name],"noscript.sqf", format ['["%1"] call clothing_switch;',_class], 1, false, true, "", format ["typeOf player != '%2' && {%1}",_condition,_class]];
		};
	}forEach _targets;
}forEach v_clothing_actions;