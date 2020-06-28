private ["_client","_side","_object"];

_client = _this select 0;
_side = _this select 1;

{
	_object = _this select 0;
	if (isNull _object)then {
		DTK_Sync set [_forEachIndex,""];
		DTK_Sync = DTK_Sync - [""];
	};
}forEach DTK_Sync;

[_client,DTK_Sync,"network_JipRecive",false,false]call network_MPExec;
