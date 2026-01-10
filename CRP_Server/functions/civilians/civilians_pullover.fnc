private ["_siren","_pullPos"];
_siren = _this select 0;

{
	if (!isPlayer _x && {_x distance _siren < 25} && {isOnRoad _x} && {vehicle _x == _x})then {
		[_siren,_x,{systemchat format["%1 is pulling over",_this];},false,false]call network_MPExec;
		_pullPos = (vehicle _x) modelToWorld [6, -5, 0];
     	(group _x) doMove _pullPos;
	}

}forEach allUnits;