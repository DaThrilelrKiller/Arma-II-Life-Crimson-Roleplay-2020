civilians_pullover = {
private ["_siren","_pullPos"];
_siren = _this select 0;

["ALL",[],{systemchat "test";},false,false]call network_MPExec;

{
	if (!isPlayer _x && {_x distance _siren < 25} && {isOnRoad _x} && {vehicle _x != _x} && {[_siren,_x,0]call bis_isInFrontOf})then {
		_pullPos = (vehicle _x) modelToWorld [6, -5, 0];
     	(group _x) Move _pullPos;
		(vehicle _x) setPos _pullPos;
	};

}forEach allUnits;
};