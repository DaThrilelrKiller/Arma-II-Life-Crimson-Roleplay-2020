private ["_name","_gangs","_locktext"];

/* grab needed prams */
_name = (ctrlText 5);
_gangs = gangs getVariable ["Names",[]];
_locktext = format["%1_locked",_name];

/* check if name is valid for use */
if (_name == "Names" && !(_name in dtk_notAllowed))exitWith {systemchat "That name cannot be used"};
if (_name in _gangs)exitWith {systemchat "Gang already exsist"};
if (_name == _locktext)exitWith {systemchat "That name cannot be used"};

/* go ahead and add the gang to gang list */
_gangs set[count _gangs,_name];

/* go ahead and create the gang data variables */
gangs setVariable ["Names",_gangs,true];
gangs setVariable [_name,[[name player,"Leader"]],true];

["SERVER",_name,"s_gang_save",false,false]call network_MPExec;

closeDialog 0;
call gang_open;
