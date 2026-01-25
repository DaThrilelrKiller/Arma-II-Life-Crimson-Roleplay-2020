private ["_queue","_current","_Available","_pending","_production"];

_queue = DTK_ActiveFactory getVariable ["dtk_queue",[]];
_current = _queue select (lbCurSel 1);

_Available = 0;
_pending = -1;
_production = 0;

{
	if (time > _x)then{
		_Available = _Available + 1;
	}else{
		_pending = _pending + 1;
		_production = 1;
	};
}forEach _current;

[_Available,_pending,_production]