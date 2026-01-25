private ["_variable","_function","_client","_value"];

_variable = _this select 0;
_function = _this select 1;
_client = _this select 2;

if (count _this == 3)then {
	[_client,[_variable,_function,player,""],"network_variable",false,false]call network_MPExec;
}else{
	_value = missionNamespace getVariable _variable;
	[_client,_value,_function,false,false]call network_MPExec;
};
