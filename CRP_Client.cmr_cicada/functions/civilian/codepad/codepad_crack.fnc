private ["_object","_code"];

_object = _this select 0;
_object = if (typename _object != "OBJECT")then{cursorTarget}else{_object};

if (animationstate player == "AinvPknlMstpSlayWrflDnon_medic")exitWith {
	
systemchat "you are already picking up cash";
};

["ALL",[player,"AinvPknlMstpSlayWrflDnon_medic"],"network_SwitchMove",false,true]call network_MPExec;	

waitUntil {animationstate player != "AinvPknlMstpSlayWrflDnon_medic"};

_code = [8,_object] call codepad_getCode;;

if ([60]call Main_Random)then {
	["ALL",[],{	titleText ["$$$ WARNING $$$ Security Guards have spotted armed men attempting to break into the Vault!!! $$$ WARNING $$$", "PLAIN DOWN"]; player  say "Bank_alarm";},false,true]call network_MPExec;
};


if ([40]call Main_Random) exitWith {
	systemchat format ["Codepad Code Found: %1",_code];
	[theVault,{theVault animate ["vaultLockAnim",0]}]call codepad_open;
};


_array = [0,1,2,3,4,5,6,7,8,9];
_return = "";

for [{_i = 0}, {_i < 8}, {_i=_i+1}] do {
    _return = _return + str(_array select (random (count _array - 1)));
};

systemchat format ["Codepad Code Found: %1",_return];

[theVault,{
	theVault animate ["vaultLockAnim",0];
	theVault spawn vault_close;
}]call codepad_open;