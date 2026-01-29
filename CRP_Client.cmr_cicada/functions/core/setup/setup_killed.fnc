private["_module"];

{
	_module = _x;
	if (typeName _module == "ARRAY")then{
		_module = _module select 1;
	};

	if (!isNil format["%1_killed",_module])then {
		call call compile format["%1_killed",_module];
	};
}count dtk_active_modules;