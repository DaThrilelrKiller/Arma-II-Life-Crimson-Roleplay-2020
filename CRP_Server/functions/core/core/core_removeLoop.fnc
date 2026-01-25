private ["_index","_thread"];
_index = _this;

_thread = core_loop_array select _index;
if !(scriptDone _thread)then {
	terminate _thread;
};

core_loop_array set [_index,""];
core_loop_array = core_loop_array - [""];