if (dtk_server)exitWith {};

{
	_x addaction ["Pull lever","noscript.sqf", format ["%1 spawn slots_start",_x], 1, false, true,"LeanRight",format ["player distance _target < 5 && {!([_target,'Pull Lever (E)','\crp_data\images\items\money']call tag_show)}",_img,_text]];
	true
}forEach dtk_machines;

["Casino_mrk",[7361.24,2909.17,0.00144196],nil,nil,"ColorBlue","mil_box",nil,"Casino"]call core_createMarkerLocal;