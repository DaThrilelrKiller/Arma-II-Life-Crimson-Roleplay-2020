_object = _this select 0;

if (isNull _object)then {
	_object = cursorTarget;
};

if (isNull _object)exitWith {
	systemchat "You must be staring at the object you are trying to get finger prints from";
};

_name = _object call fingerprints_name;

if (dtk_fingers)exitWith {systemChat "You are already brushing for finger prints"};

dtk_fingers = true;
dtk_finger_action = player addaction [format["Stop investigating",_name],"noscript.sqf", 'dtk_fingers = false', 1, false, true, "", "true"];


for "_y" from 1 to round(random 5)+ 1 step 1 do 
{ 
	[format["Brushing %1 for finger prints...",_name],'\crp_data\images\tags\fingerprint']call tag_notify;
	["ALL",[player,"ainvpknlmstpslaywrfldnon_medic"],"network_SwitchMove",false,true]call network_MPExec;
	waitUntil {animationState player != "ainvpknlmstpslaywrfldnon_medic" or !dtk_fingers};
	if !(dtk_fingers)exitWith {};
	if (isNull _object)exitWith {systemchat format["someone has picked up %1",_name]};
};

if (dtk_fingers)then {
	[_object,[_object,player],"fingerprints_get",false,false]call network_MPExec;
};

player removeAction dtk_finger_action;
dtk_fingers = false;