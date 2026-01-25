private ["_key","_shift","_ctrl","_alt","_return","_data","_functions"];

_key     = _this select 1;
_shift = _this select 2;
_ctrl = _this select 3;
_alt = _this select 4;
_return = false;

if (_shift or _ctrl or _alt)then {
	_data = [format["dtk_ku_%1_%2_%3_%4",_key,_shift,_ctrl,_alt]];
}else{
	_data = [format["dtk_ku_%1_%2_%3_%4",_key,_shift,_ctrl,_alt],format["dtk_ku_%1",_key]];
};

_functions = {
	if (!isNil _x)exitWith {
		missionNamespace getVariable _x;
	};
}ForEach _data;

if (isNil "_functions")exitWith {false};

{
	_return = (_x select 0) call (_x select 1);
	_return = [true,_return]select !isNil "_return";
	_return = [true,_return]select ((typeName _return) == "BOOL");
}ForEach _functions;

_return