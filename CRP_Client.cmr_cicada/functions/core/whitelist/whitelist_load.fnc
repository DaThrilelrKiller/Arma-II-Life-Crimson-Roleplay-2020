private ["_value","_tag"];

{
	_value = _this select _forEachIndex;
	if (_value)then {
		_tag = _x select 0;
		_tag = if (_tag in dtk_tags)then {_tag}else{tag_default_icon};
		player setVariable["dtk_tag",format["\crp_data\images\tags\%1",_tag],true];
	};
	missionNamespace setVariable [_x select 1,_value];
}forEach whitelist_data;

diag_log text "[LOG]Whitelist Loaded!";

AR_Whitelistloaded = true;