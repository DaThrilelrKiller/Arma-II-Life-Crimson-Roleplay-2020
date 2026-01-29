
{
	if (_x select 0 == _this)exitWith {
		if (v_fishing_inspot)then {_x select 1}else{_x select 2};
	};
	0
}ForEach fishing_config;