
/*if you try to double lace somting, add a change for meth lab fire*/
private ["_laced"];

{
	_laced = (_x call config_code == "lab_use");
	if (_laced)exitWith {true};
	false
}forEach _this;