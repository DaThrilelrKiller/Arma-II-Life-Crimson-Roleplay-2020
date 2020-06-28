private ["_nearman","_return"];

_nearman = (nearestObjects [getpos player,["Man"],4]);
_nearman = _nearman - [player];
_return = false;
ems_nearman = ObjNull;

{
	if (lifeState _x == "UNCONSCIOUS") exitWith 
	{
		_return = true;
		ems_nearman = _x;
	};
	nil
}count _nearman;

_return