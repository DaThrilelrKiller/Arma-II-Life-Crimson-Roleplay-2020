private ["_target","_n","_i"];

_target = (crew _this) select 0;
_n 	= 10;
_exitvar = false;

if (locked _this) then {systemChat  "The car is locked. This might take a while."; _n = 16;};
			
systemChat  format ["You're pulling out %1. Stay close to the car!", _target];
[_target,["true",format ["%1 is pulling you out of the car!", name player],1],"network_chat",false,false]call network_MPExec;
	
for [{_i=0}, {_i < _n}, {_i=_i+1}] do {
	if (player distance _target > 3) exitWith {
		systemChat  "You are too far away."; _exitvar = true;
	};
	sleep 0.3;
};

if(_exitvar)exitwith{};
		
_this lock false;

player switchMove "AmovPercMstpSnonWnonDnon_AcrgPknlMstpSnonWnonDnon_getInLow";
sleep 0.4;
[_target,["eject", vehicle _target],"network_action",false,false]call network_MPExec;
moveOut _target;
