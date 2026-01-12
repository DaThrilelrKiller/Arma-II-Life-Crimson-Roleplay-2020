private ["_total","_msg","_start","_stop","_moduleTime","_moduleName","_totalStart","_totalStop"];

_total = count DTK_INIT;
_msg = "";
_totalStart = diag_tickTime;

{
	_start = diag_tickTime;
	
	if (dtk_client)then {
		if (typeName _x == "CODE")then {
			_moduleName = format["Module_%1",_forEachIndex];
		}else{
			_moduleName = _x select 1;
		};
		titleText [format["Loading %1 Module (%2 of %3) %4",_moduleName,_forEachIndex + 1,_total,_msg], "PLAIN",0];
		_msg = format ["%2 Module Complete\n %1",_msg,_moduleName];
	};
	
	if (typeName _x == "CODE")then {
		call _x;
		_moduleName = format["Module_%1",_forEachIndex];
	}else{
		call (_x select 0);
		_moduleName = _x select 1;
	};
	
	_stop = diag_tickTime;
	_moduleTime = _stop - _start;
	diag_log format ["[PERF] Module '%1' took %2 seconds",_moduleName,_moduleTime];
	
}forEach DTK_INIT;

_totalStop = diag_tickTime;
DTK_INIT = nil;

diag_log format ["[LOG] Modules Initialization Finished! Total time: %1 seconds",_totalStop - _totalStart];