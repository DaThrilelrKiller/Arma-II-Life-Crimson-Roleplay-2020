private ["_client","_side"];

_client = _this select 0;
_side = _this select 1;

if (_side == "CIV")then {
	[_client,hunting_spots_array,"hunting_spots",false,false]call network_MPExec;
};
