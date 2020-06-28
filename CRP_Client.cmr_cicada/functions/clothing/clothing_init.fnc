if (dtk_server)exitWith {};

{
	(_x select 0) addaction ["","noscript.sqf",format["%1 call clothing_menu;",_x], 25, false, true, "LeanRight",format["call %1 && {!([_target,'Clothing Shop (E)','\crp_data\images\tags\Clothing']call tag_show)}",_x select 2]];
	[("Clothing_" + str _ForEachIndex),getPos (_x select 0),nil,nil,"ColorRed","mil_box",nil,format ["Clothing Shop %1",_ForEachIndex]]call core_createMarkerLocal;

}forEAch dtk_clothingshops;


private ["_name","_condition","_class","_index"];
{
	_name = (_x select 0);
	_class = (_x select 1);
	_condition = (_x select 2);
	{
		_x addaction [format ["Switch To %1",_name],"noscript.sqf", format ['["%1"] call clothing_switch;',_class], 1, false, true, "", format ["typeOf player != '%2' && {%1}",_condition,_class]];
	}forEach (_x select 3);
}forEach v_clothing_actions;