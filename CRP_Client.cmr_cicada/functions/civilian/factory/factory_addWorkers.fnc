

if ([player,"geld", -10000] call storage_add)then {
	_workers = _this getVariable ["dtk_workers",1];
	if (_workers >= 10)exitWith {
		systemchat "Max workers reached at factory";
	};

	_workers = _workers + 1;
	_this setVariable ["dtk_workers",_workers,true];
	systemchat format ["You have hired another worker, Workers: (%1/10)",_workers];
}else{
	systemchat "You need 10,000$ to hire another worker";

};