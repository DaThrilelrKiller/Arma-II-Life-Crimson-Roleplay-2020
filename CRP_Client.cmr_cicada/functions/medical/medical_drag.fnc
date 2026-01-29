private ["_unit"];

_unit = _this select 0;
medical_draging = true;
dtk_disabledkeys = [44,47,45,46,21];

player playActionNow "grabDrag";
uiSleep 2;
["ALL",[_unit,"ainjppnemstpsnonwrfldb_still"],"network_SwitchMove",false,true]call network_MPExec;
_unit setDir 180;
uiSleep 0.02;
_unit attachto [player,[0.1, 1.01, -0.5],"lefthand"];

while {medical_draging} do {

	if (vehicle player != player) then {
		player action ["eject", vehicle player];
		systemchat "you cannot get into a car while dragging a body, the body has been droped";
		medical_draging = false;
	};
	
	if (lifeState _unit != "UNCONSCIOUS")then {
		medical_draging = false;
		systemchat "The person you where dragging has been revived";
	
	};
	
	if !(medical_draging)exitWith {};
};

if (lifeState _unit == "UNCONSCIOUS")then {
["ALL",[_unit,"ainjppnemstpsnonwrfldnon"],"network_SwitchMove",false,true]call network_MPExec;
 
}else{
["ALL",[_unit," "],"network_SwitchMove",false,true]call network_MPExec;
};

detach _unit;
detach player;
["ALL",[player," "],"network_SwitchMove",false,true]call network_MPExec;

dtk_disabledkeys = [];
