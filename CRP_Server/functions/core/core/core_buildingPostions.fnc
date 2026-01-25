
_return = [];

_i = 0;
while {true} do 
{
	_pos = _this buildingPos _i;
	if (str _pos == '[0,0,0]') exitWith {};
	
	_return set[count _return,_pos];
	_i = _i + 1;
};

if (count _return == 0)then {
	_return set[count _return,getPos _this];
};

_return
