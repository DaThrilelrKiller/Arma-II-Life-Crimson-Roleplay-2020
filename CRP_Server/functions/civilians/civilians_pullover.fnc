private ["_siren","_pullPos"];
_siren = _this select 0;

[_siren,[],{systemchat "test";},false,false]call network_MPExec;

{
	if (!isPlayer _x && {_x distance _siren < 150} && {isOnRoad _x} && {vehicle _x != _x} && {[_siren,_x,0]call bis_isInFrontOf})then {
		_pullPos = (vehicle _x) modelToWorld [3, 15, 0];
     	(group _x) doMove _pullPos;
		(group _x) setVariable ["pulled_over",(time + 120),true];
	};

}forEach allUnits;