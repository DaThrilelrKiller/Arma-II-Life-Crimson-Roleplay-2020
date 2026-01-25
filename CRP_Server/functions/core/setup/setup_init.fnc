private ["_total","_start","_stop","_moduleTime","_totalStart","_totalStop"];

_total = count DTK_INIT;
_totalStart = diag_tickTime;

{
	_start = diag_tickTime;
	[]call _x;
	_stop = diag_tickTime;

	_moduleTime = _stop - _start;
	diag_log format ["[PERF] Module '%1' took %2 seconds",_forEachIndex,_moduleTime];
	
}forEach DTK_INIT;

_totalStop = diag_tickTime;
diag_log format ["[LOG] Modules Initialization Finished! Total time: %1 seconds",_totalStop - _totalStart];