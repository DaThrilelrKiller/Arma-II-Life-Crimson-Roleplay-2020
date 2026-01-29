createDialog "admin_clothes";
admin_selected = 4;
[2100, true] call dtk_PlayerListToControl;
call admin_load;

_config = configFile >> "cfgVehicles";

for "_i" from 0 to (count _config)-1 do {
	_class = _config select _i;
	if (isClass _class) then {
	_name = configName(_class);	
	if (_name isKindof "Man")then {
		_display = getText(_config >> _name >> "displayName");
		_picture = getText(_config >> _name >> "picture");
		_index = lbAdd [1501,format ["%1",_display]];
		lbSetData [1501, _index, _name];
		lbSetPicture [1501, _index, format ["%1",_picture]];
	};
	};
};