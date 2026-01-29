
ui_fade = {
_dialog = _this select 0;

_class = missionConfigFile >> _dialog;
_display = getNumber (_class >> "idd");
_controls = _class >> "Controls";

for "_i" from 0 to (count _controls)-1 do {
	_class = _controls select _i;
	if (isClass _class) then {
		_name = configName(_class);
		_idc = getNumber (_controls >> _name >> "idc");
		_control = (findDisplay _display)displayCtrl _idc;
		_control ctrlSetFade 1;
		_control ctrlCommit 0;
		_control ctrlSetFade 0;
		_control ctrlCommit 2;
		systemchat format["%1 %2",_display,_idc];
	};
};
};

[]spawn {
closeDialog 0;
sleep 1;
[]call ipad_open;
["ipad"]call ui_fade;
};