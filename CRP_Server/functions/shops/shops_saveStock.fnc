// Save stock to shops.ini
private ["_shopVarName","_item","_count"];

_shopVarName = _this select 0;
_item = _this select 1;
_count = _this select 2;

// Save using stats_write format: ["shops", shopVarName, item, inventoryCount]
["shops", _shopVarName, _item, _count] call s_stats_write;

true
