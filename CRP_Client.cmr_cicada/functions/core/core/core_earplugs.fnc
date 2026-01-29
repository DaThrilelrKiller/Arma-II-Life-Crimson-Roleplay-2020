if (soundVolume == 1) then {
	1 fadeSound 0.5;
	titletext["You put earplugs in!", "PLAIN DOWN"];
} else {
	1 fadeSound 1;
	titletext["You took earplugs out!", "PLAIN DOWN"];
};