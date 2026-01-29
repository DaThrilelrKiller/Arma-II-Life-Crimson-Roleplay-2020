private ["_queue","_current","_return"];

_queue = DTK_ActiveFactory getVariable ["dtk_queue",[]];
_current = _queue select _this;

if (count _queue == 0)exitWith {false};
if (count _current == 0)exitWith {false};

_return = {
	if (time > _x)exitWith {true};
	false
}forEach _current;

_return