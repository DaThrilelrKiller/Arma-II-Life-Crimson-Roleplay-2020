private ["_return"];
_return = profileNamespace getVariable ["dtk_tag","Guest"];

_return = if (_return == "Guest")then {
	if (SwagDevs)exitwith {"Developer"};
	if (adminlevel4)exitwith {"Admin"};
	if (adminlevel3)exitwith {"Admin"};
	if (adminlevel2)exitwith {"Mod"};
	if (PMC_General || {PMC_Commander} || {PMC_Lieutenant} || {PMC_Sergeant} || {PMC_Corporal} || {PMC_Private} || {PMC_Recruit})exitWith {
		if (dtk_civ)then {"PMC"}else{"Guest"};
	};
	if ("CRP" in ([name player,"[]"]call string_split))exitwith {"Member"};
	_return
};


_return