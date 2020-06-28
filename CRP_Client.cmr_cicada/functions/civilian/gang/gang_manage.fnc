private ["_name","_rank"];

/* grab the variables */
_name = _this;
_rank = _name call gang_rank;
_locked =  gangs getVariable [format["%1_locked",_name],false];
_locked = ["Lock","Un-Lock"]select _locked;

createDialog "gang_menu1";

ctrlSetText [1,_name];
/* loads listboxes */
[2,_name]call gang_members;
[4, true] call dtk_PlayerListToControl;


ctrlSetText [6,"Rename"];
ctrlSetText [7,"Leave"];
ctrlSetText [9,_locked];

/* if not a gang leader go ahead and lock certain buttons */
if ((_name call gang_rank) != "Leader")then {
ctrlEnable [6, false];
ctrlEnable [8, false];
ctrlEnable [9, false];
ctrlEnable [10, false];
ctrlEnable [11, false];
ctrlEnable [12, false];
};

/* sets button actions */
buttonSetAction [10,"call gang_invite"];
buttonSetAction [8,"call gang_kick"];
buttonSetAction [9,"call gang_lock"];
buttonSetAction [6,"[(ctrlText 5)]call gang_rename"];
buttonSetAction [7,"call gang_leave"];
buttonSetAction [11,"call gang_setRank"];
buttonSetAction [12,"call war_create"];



