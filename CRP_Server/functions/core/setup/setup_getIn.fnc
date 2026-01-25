private["_module"];

waitUntil {vehicle player != player and (vehicle player) != setup_vehicle};
setup_vehicle = (vehicle player);

{
	_module = _x;
	if (typeName _module == "ARRAY")then{
		_module = _module select 1;
	};
	
	if (!isNil format["%1_getin",_module])then {
		call compile format["%1_getin",_module];
	};
}count dtk_active_modules;

[]spawn setup_getIn;