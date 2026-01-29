private ["_name","_gangs","_gang","_index","_locked","_members"];


_name = _this select 0;
_gangs = gangs getVariable ["Names",[]];

/* checks for invalid names */
if (_name == "Names" || (_name in dtk_notAllowed))exitWith {systemchat "That name cannot be used"};
if (_name in _gangs)exitWith {systemchat "Gang already exsist"};


/* grabs old gang info */
_gang = player call gang_name;
_index = _gangs find _gang;
_gangs set[_index,_name];
_locked =  gangs getVariable [format["%1_locked",_gang],false];
_members = gangs getVariable [_gang,[]];

/* deletes old variables*/
gangs setVariable [_gangs,nil,true];
gangs setVariable [format["%1_locked",_gang],nil,true];

/* Tranfers old info to new name */
gangs setVariable ["Names",_gangs,true];
gangs setVariable [_name,_members,true];
gangs setVariable [format["%1_locked",_gang],_locked,true];

["SERVER",_name,"s_gang_save",false,false]call network_MPExec;

systemchat format ["%1 has been renamed to %2",_gang,_name];

if (dialog)then {
	closeDialog 0;
	call gang_open;
};
