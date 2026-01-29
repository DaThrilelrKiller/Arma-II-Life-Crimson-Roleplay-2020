private ["_shopVarName","_item","_count","_result"];

_shopVarName = _this select 0;
_item = _this select 1;
_count = _this select 2;

_result = ["shops", _shopVarName, _item, _count] call s_stats_write;

if (_result) then {
	diag_log formatText ["[SHOPS] Successfully saved stock: shops/%1/%2 = %3", _shopVarName, _item, _count];
} else {
	diag_log formatText ["[SHOPS] FAILED to save stock: shops/%1/%2 = %3", _shopVarName, _item, _count];
};

_result
