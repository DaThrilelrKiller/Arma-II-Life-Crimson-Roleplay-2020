_target = _this select 0;

If (dtk_dog distance _target <= 4) then{
	dtk_dog doMove getPos _target;		
	systemchat format ["Checking %1 For Illegal Contraband!", _target];
	drugsvalue = 0;	
	(format ["if (player == %1) then {[""drugs"", %2] execVM ""scripts\civmenu.sqf"";};", _target, player]) call network_broadcast;								

}
else 
{ 
	dtk_dog doMove getPos _target;
	systemchat"Your Dog Is Not Close Enough To Suspect!";
};