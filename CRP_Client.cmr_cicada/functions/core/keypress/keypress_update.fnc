private ["_name","_type","_key","_shift","_ctrl","_alt","_keyvarialbe","_code"];

_name = lbText [1401, (lbCurSel 1401)];
_data = profileNamespace getVariable _name;
_type = ([_data,"_"] call string_split)select 1;

_key =  (lbText [2100, (lbCurSel 2100)])call keypress_number;

_shift = call compile lbText [2101, (lbCurSel 2101)];
_ctrl = call compile lbText [2102, (lbCurSel 2102)];
_alt = call compile lbText [2103, (lbCurSel 2103)];

_keyvarialbe = [format ["dtk_%1_%2",_type,_key],format ["dtk_%1_%2_%3_%4_%5",_type,_key,_shift,_ctrl,_alt]]select (_shift or _ctrl or _alt);
_code = missionnamespace getVariable _data;

missionnamespace setVariable [profileNamespace getVariable _name,nil];

profileNamespace setVariable [_name,_keyvarialbe];
missionnamespace setVariable [profileNamespace getVariable _name,_code];