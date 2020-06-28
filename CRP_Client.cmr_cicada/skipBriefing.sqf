/*
	Created By: DaThrillerKiller
	For: Crimson Roleplay
*/

waitUntil{
	if (!isNull findDisplay 53) exitWith {
		diag_log text "[LOG]Briefing Skiped";
		ctrlActivate (findDisplay 53 displayCtrl 1);
		findDisplay 53 closeDisplay 1;
		true
	};

(time > 1)
};