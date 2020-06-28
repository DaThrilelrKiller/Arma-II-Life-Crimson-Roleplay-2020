
if (dtk_server)then {
	v_fuel_cost = 100; 
	publicvariable "v_fuel_cost";
}else{
	call fuel_actions;
};


call fuel_setup;