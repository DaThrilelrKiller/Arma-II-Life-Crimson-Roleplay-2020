private ["_key","_shift","_ctrl","_alt","_return","_data","_functions"];

_key     = _this select 1;
_shift = _this select 2;
_ctrl = _this select 3;
_alt = _this select 4;
_return = if (([2,3,4,5,6,7,8,9,10,11] find _key) > -1)then {true}else{false};


if (_shift or _ctrl or _alt)then {
	_data = [format["dtk_kd_%1_%2_%3_%4",_key,_shift,_ctrl,_alt]];
}else{
	_data = [format["dtk_kd_%1_%2_%3_%4",_key,_shift,_ctrl,_alt],format["dtk_kd_%1",_key]];
};

_functions = {
	if (!isNil _x)exitWith {
		missionNamespace getVariable _x;
	};
}ForEach _data;

if (isNil "_functions")exitWith {_return};

{
	_return = (_x select 0) call (_x select 1);
	_return = [false,_return]select !isNil "_return";
}ForEach _functions;

if (([2,3,4,5,6,7,8,9,10,11] find _key) > -1)then {
	_return = true;
};

_return
