telemetry_log = {
_str = "";

{
	_str = format ["%1 %2 -",_str,_x];

}forEach _this;

diag_log text _str;
systemchat _str;
};