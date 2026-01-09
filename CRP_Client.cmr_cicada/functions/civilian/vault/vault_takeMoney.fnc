_object = _this select 0;

if (animationstate player == "AinvPknlMstpSlayWrflDnon_medic")exitWith {
	systemchat "you are already picking up cash";
};


for "_i" from 20 to 1 step -1 do {
	_selection = if (_i < 10)then {format ['0%1',_i];}else{_i};
	_phase = _object animationPhase format["bun%1anim",_selection];
	if (_phase == 0)exitWith {
			if !(alive player)exitWith {};
			
			["ALL",[player,"AinvPknlMstpSlayWrflDnon_medic"],"network_SwitchMove",false,true]call network_MPExec;	
			['Taking Money...','data\images\items\money',true,_object]call tag_notify;
			
			waitUntil{animationstate player != "AinvPknlMstpSlayWrflDnon_medic"};
			[player,'geld',60000]call storage_add;
		_object animate [format["bun%1anim",_selection],1];
	};

};

