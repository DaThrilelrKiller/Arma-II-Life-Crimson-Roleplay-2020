private ["_pos","_size","_animal","_max","_inArea","_outArea","_unit"];

{
	_pos  	= getmarkerpos (_x select 0);
	_size 	= _x select 1;
	_animal = _x select 2;
	_max = _x select 3;

	_inArea 	= nearestobjects [_pos, [_animal], _size];
	_outArea = nearestobjects [_pos, [_animal], (_size + 200)]; 
	
	if(count _outArea > count _inArea)then{
		deletevehicle (_outArea select (count _outArea - 1));
	};

	if(count _inArea < _max)then{
		_unit = createAgent [_animal, _pos, [], _size, "NONE"];
		_unit call core_setVarName;
		["ALL",[_unit,['','noscript.sqf',format["[%1]call hunting_harvest",_unit],25,false,true,'LeanRight','!alive _target && {!([_target,"Harvest Boar Meat(E)","\crp_data\images\items\raw-meat"]call tag_show)}']],"network_addAction",false,true]call network_MPExec;
	};
	
}forEach huntingarray;