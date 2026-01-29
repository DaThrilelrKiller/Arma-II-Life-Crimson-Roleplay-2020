private ["_object","_amount"];

_object = _this select 0;
_amount = if (count _this > 1)then {_this select 1}else{round random 20};

for "_i" from 20 to 1 step -1 do {
	_selection = [_i,format ['0%1',_i]]select (_i < 10);
	if (_i > _amount)then {
		_object animate [format["bun%1anim",_selection],1];
	}else{
		_object animate [format["bun%1anim",_selection],0];
	};
};