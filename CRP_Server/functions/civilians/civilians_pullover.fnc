private ["_siren","_pullPos","_unit"];
_siren = _this select 0;
_unit = _this select 1;

if (!isPlayer _unit && {_unit distance _siren < 150} && {[_siren,_unit,0]call bis_isInFrontOf})then {
	[_siren,[],{systemchat "Pullihng Over";},false,false]call network_MPExec;

	_pullPos = (vehicle _unit) modelToWorld [3, 15, 0];
    (group _unit) Move _pullPos;
	(group _unit) setVariable ["pulled_over",(time + 120),true];
};