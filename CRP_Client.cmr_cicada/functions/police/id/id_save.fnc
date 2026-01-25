
dtk_dob = [
	lbText [1, (lbCurSel 1)],
	lbText [2, (lbCurSel 2)],
	lbText [3, (lbCurSel 3)],
	lbText [4, (lbCurSel 4)]
];

["SERVER",[player, [ 
	["Main", "data", dtk_dob] 
] ],"S_stats_update",false,false]call network_mpexec;

private ["_face"];
_face = "";
if (typeName dtk_dob == "ARRAY" && {count dtk_dob > 3} && {typeName (dtk_dob select 3) == "STRING"}) then {
	_face = dtk_dob select 3;
};
if (_face == "") then { _face = face player; };
// Arma 2 OA: set face directly; avoids brittle setVehicleInit/format parsing issues.
player setFace _face;

[] call spawn_openMenu;