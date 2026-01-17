private ["_pos","_size","_animal","_max","_inArea","_outArea","_unit","_spotSize","_areaName","_animalVariants","_currentAnimal","_playersNear","_checkDistance"];

{
	_areaName = _x select 0;
	_animalVariants = _x select 1;
	_pos = _x select 2;
	_spotSize = _x select 3;
	_size = _spotSize select 0;
	_max = round(_size / 8);
	_checkDistance = _size + 50;

	_playersNear = false;
	{
		if (_pos distance _x < _checkDistance) exitWith {
			_playersNear = true;
		};
	}forEach playableUnits;

	_inArea = nearestobjects [_pos, _animalVariants, _size];

	if (!_playersNear) then {
		{
			if (!isNull _x) then {
				deleteVehicle _x;
			};
		}forEach _inArea;
	} else {
		_currentAnimal = _animalVariants call BIS_selectRandom;
		_outArea = nearestobjects [_pos, _animalVariants, (_size + 200)]; 
		
		if(count _outArea > count _inArea)then{
			deletevehicle (_outArea select (count _outArea - 1));
		};

		while {count _inArea < _max} do {
			_animal = _animalVariants call BIS_selectRandom;
			_unit = createAgent [_animal, _pos, [], _size, "NONE"];
			_unit call core_setVarName;
			["ALL",[_unit,['','noscript.sqf',format["[%1]call hunting_harvest",_unit],25,false,true,'LeanRight','!alive _target && {!([_target,"Harvest Boar Meat(E)","data\images\items\raw-meat"]call tag_show)}']],"network_addAction",false,true]call network_MPExec;
			_inArea = nearestobjects [_pos, _animalVariants, _size];
		};
	};
	
}forEach hunting_spots_array;