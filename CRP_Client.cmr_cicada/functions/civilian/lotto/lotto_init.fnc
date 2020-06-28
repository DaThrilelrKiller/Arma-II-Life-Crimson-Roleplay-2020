if (dtk_server)exitWith {};

{
	_x addAction [format [localize "STRS_lotto_action"], "noscript.sqf", "[]call lotto_open;",1,false,true,"",""];
}forEach LottoLocations;