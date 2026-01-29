private["_module"];

{
	_module = _x;
	if (typeName _module == "ARRAY")then{
		_module = _module select 1;
	};

	if (!isNil format["%1_handleDamage",_module])then {
		_return = _this call call compile format["%1_handleDamage",_module];
	};
}count dtk_active_modules;

_return