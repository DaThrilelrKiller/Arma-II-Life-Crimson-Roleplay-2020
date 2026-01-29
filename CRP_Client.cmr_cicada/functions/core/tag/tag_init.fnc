if (dtk_server)exitWith {
		[]spawn tag_motd;
};

10 cutRsc ["tag", "PLAIN"];

{
	if (player != _x)then { 
		_x addaction ["","noscript.sqf",format['%1 call core_interact;',_x],25,false,true,"LeanRight",format["player distance _target < 5 && {alive _target} && {!([_target,'Interact (E)','%1']call tag_show)}",player getVariable ["dtk_tag",tag_default]]];
	};
}Foreach playableunits;