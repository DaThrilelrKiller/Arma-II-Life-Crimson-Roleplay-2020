
if (dtk_server)then {
	v_fuel_cost = 100; 
	publicvariable "v_fuel_cost";
	[]call fuel_setup;
}else{
	call fuel_actions;
};