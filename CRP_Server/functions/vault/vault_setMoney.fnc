private ["_vault","_object"];

_vault = _this;

{
	_object = "il_money_stack_20" createVehicle [0,0,0];
	_object setPosASL (_vault modelToWorld _x);
	_object call core_setVarName;
	
	[_object]call s_vault_setAmount;
	["ALL",[_object,['','noscript.sqf',format['[%1]spawn vault_takeMoney',_object],-1,false,true,'LeanRight','player distance _target < 5 && {dtk_civ} && {!([_target,"Take Money (E)","data\images\items\money"]call tag_show)}']],"network_addAction",false,true]call network_MPExec;
}forEach dtk_VaultMoney;