
_array = _this select 0;
_amount = _this select 1;
_index = if (count _this > 2)then {_this select 2}else{0};

_data = missionNamespace getVariable [_array,[]];

if (count _data > _amount)then {
	_data set [_index,""];
	_data = _data - [""];
	missionNamespace setVariable [_array,_data];
};
