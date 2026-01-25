private ["_unit","_votes"];

if (lbCurSel 1 == -1)exitWith {
systemchat "seleced someone to vote for";
};

if ((ctrlText 67) == "Run For Gov")exitWith {
	call goverment_run;
};


_unit = call compile lbData [1, (lbCurSel 1)];
_votes = _unit getVariable ["votes",0];

_votes = _votes + 1; 
_unit setVariable["votes",_votes,true];

systemchat format ["You have voted for %1",name _unit];
closeDialog 0;
V_voted = true;