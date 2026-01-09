
_object = _this select 0;
_place = _this select 1;

_cracking = _object getVariable ["cracking",name player];

if (_cracking != name player)exitWith {
	systemchat format ["%1 is already cracking the safe",_cracking];
};

if (!(call INV_isArmed)) exitwith
{
	systemchat format ["%1 you must have a gun to rob the %2 silly!",name player,_place];
}; 

if !([player,"safehack",-1]call storage_add)exitWith {
	systemchat format["You need a Vault code cracker to rob %1",_place];
};

["ALL",[],{	titleText [format["$$$ WARNING $$$ Security Guards have spotted armed men attempting to break into the %1!!! $$$ WARNING $$$",_place], "PLAIN DOWN"]; player  say "Bank_alarm";},false,true]call network_MPExec;

_object setVariable ["cracking",name player,true];

[player,"Bank Robbery",100000]call cdb_addWarrant;

for "_i" from 1 to 100 step 1 do {
		[format['Cracking into bank safe... %1%2',_i,"%"],'data\images\items\lockpick',true]call tag_notify;
		uiSleep 0.7;
		if(!alive player)exitWith {
			systemchat "Mission failed due to you dying";
			bank_progress = -1;
		};
		if(animationstate player == "actspercmstpsnonwrfldnon_interrogate02_forgoten")exitWith {
			systemchat "You have been caught in a dirty crime";
			bank_progress = -1;
		};
		if(player distance _object > 10)exitWith {
			systemchat "you have went to far away from the safe";
			bank_progress = -1;
		};
		bank_progress = _i;
};

if (bank_progress == 100)then {
		["You have sucefully opened the safe, take all the damn money..",'data\images\items\lockpick',true]call tag_notify;
		_object setVariable ["cracking",nil,true];
		_object setVariable ["cracked",0,true];
		bank_progress = -1;
}else{
		["Mission failed",'data\images\items\lockpick',true]call tag_notify;
};