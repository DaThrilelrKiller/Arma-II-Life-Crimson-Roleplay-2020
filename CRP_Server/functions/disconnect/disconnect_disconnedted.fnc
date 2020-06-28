_unit = _this call core_nametoplayer;
_array = _unit getVariable ["disconnect",[]];

[_this,_array] spawn {
	sleep 20;

	{
		diag_log formatText ["[LOG] %1 %2 | %3 %4 - Disconnect Delete",_x,typeOf _x,_this select 0];
		{
			deleteVehicle _x;
			diag_log formatText ["[LOG] %1 %2 | %3 %4 - Disconnect Delete",_x,typeOf _x,_this select 0];
		}forEach (crew _x);
		deleteVehicle _x;
	}forEach (_this select 1);

	[]call s_ems_delete;
};