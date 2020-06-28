private ["_return","_uid","_side","_key"];
_return = 0;
_uid = _this select 0;
_side = _this select 1;
_key = _this select 2;

for "_i" from 0 to 50 step 1 do {
	_data = [_uid,_side, format ["%2%1",_i,_key],[]]call s_stats_read;
	if (count _data == 0)exitWith {
		_return = _i;
	};
};

_return