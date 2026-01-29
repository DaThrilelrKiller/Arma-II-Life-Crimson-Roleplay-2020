private ["_object","_licenses"];

_object = _this select 0;
_licenses = (_object getvariable "cdb_license");

createDialog "liste_1_button";

lbAdd [1, "------------------------------------------------------------------------------------------"];
lbAdd [1, localize "STRS_statdialog_licenselist"];

{
	_name = _x call licenses_name;
	lbAdd [1, _name];
	true
}count _licenses;
