
if (time < DTK_LastLocked)exitWith {
	systemchat format ["Places wait %1 seconds before using the function again",round(DTK_LastLocked - time)];
	closeDialog 0;
};

if !(_this in DTK_Locked)then {
	dtk_locked set [count dtk_locked,_this];
	systemchat "House Locked";
}else{
	dtk_locked = dtk_locked - [_this];
	systemchat"House Un-locked";
};

DTK_LastLocked = time + 10;
closeDialog 0;
