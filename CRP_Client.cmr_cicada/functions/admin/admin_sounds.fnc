private["_config","_name","_i","_index"];

createDialog "admin_sound";
[2100, true] call dtk_PlayerListToControl;
call admin_load;

_config = configFile >> "CfgSounds";

for "_i" from 0 to (count _config)-1 do {
	_class = _config select _i;
	if (isClass _class) then {
		_name = configName(_class);	
		_index = lbAdd [1501,format ["%1",_name]];
		lbSetData [1501, _index, _name];
	};
};