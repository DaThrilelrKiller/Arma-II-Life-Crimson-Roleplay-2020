private ["_queue","_current","_return"];

_queue = DTK_ActiveFactory getVariable ["dtk_queue",[]];
_current = _queue select (lbCurSel 1);

if (count _current == 0)exitWith {0};

_return = {
	if (time < _x)then{
		_return = _x - time;
	};
	_return
}forEach _current;

_return