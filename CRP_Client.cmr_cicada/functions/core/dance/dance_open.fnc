if (dialog)exitWith {closeDialog 0};
if ((["actspercmstpsnonwrfldnon_interrogate02_forgoten","civilsitting03","civilsitting02","civilsitting01","civilsitting"] find (animationstate player)) > -1)exitWith {};
if (lifeState player == "UNCONSCIOUS")exitWith{};

createDialog "animationsdialog";

{
	lbAdd [1, (_x select 2)];	
	true
}count dance_animations;
