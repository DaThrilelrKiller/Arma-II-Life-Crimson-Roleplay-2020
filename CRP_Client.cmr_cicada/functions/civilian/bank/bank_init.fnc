if (dtk_server)exitWith {};

if !(dtk_civ)exitWith {};

{
	(_x select 0) addaction ["","noscript.sqf",format["%1 spawn bank_rob;",_x], 25, false, true, "LeanRight","player distance _target < 5 && {isNil{_target getVariable 'cracking'}} && {isNil{_target getVariable 'cracked'}} && {bank_progress == -1} && {!([_target,'Rob Safe (E)','\crp_data\images\items\lockpick']call tag_show)}"];
	(_x select 0) addaction ["","noscript.sqf",format["%1 spawn bank_take;",_x], 25, false, true, "LeanRight","player distance _target < 5 && {!isNil{_target getVariable 'cracked'}} && {bank_progress == -1} && {!([_target,'Take Money (E)','\crp_data\images\items\money']call tag_show)}"];
}ForEach bank_safes;

["Bank_mrk",[6472.91,5751.12,0.00143814],nil,nil,"ColorBlack","mil_box",nil,"National Bank"]call core_createMarkerLocal;