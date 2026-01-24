_object = _this select 0;
_cracked = _object getVariable "cracked";

if (_cracked == 10)exitWith {
	["There is no more money left in this safe",'data\images\items\money',true]call tag_notify;
};

for "_i" from 1 to 100 step 1 do {
		[format['%3/10 Taking Money... %1%2',_i,"%",_cracked],'data\images\items\money',true]call tag_notify;
		uiSleep 0.3;
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
	[player,"geld",5000] call storage_add;	
	bank_progress = -1;
	_object setVariable ["cracked",(_cracked + 1),true];
};