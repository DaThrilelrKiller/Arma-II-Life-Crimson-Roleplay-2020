
private ["_id","_index"];

_id = _this spawn {
	private ["_time","_code"];
	_time = _this select 0;
	_code = _this select 1;
	
	waitUntil {
		sleep _time;
		[]call _code;
		false
	};
};

_index = count core_loop_array;
core_loop_array set[_index,_id];

_index
