private ["_shop","_shopVarName","_inv","_item","_stock","_savedCount","_shopCount"];

if (isNil "INV_ItemShops") exitWith {
	diag_log text "[SHOPS] Cannot save - INV_ItemShops not found";
	false
};

_savedCount = 0;
_shopCount = 0;

diag_log text "[SHOPS] Starting save process...";

{
	_shop = _x select 0;
	if (!isNull _shop) then {
		if (_shop getVariable ["shop_needsSave", false]) then {
			_shopVarName = vehicleVarName _shop;
			if (_shopVarName == "") then {
				_shopVarName = format["Shop_%1", _forEachIndex];
			};
			_inv = _shop getVariable ["shop_inventory", []];
			
			diag_log formatText ["[SHOPS] Saving shop %1 with %2 inventory items", _shopVarName, count _inv];
			
			{
				_item = _x select 0;
				_stock = _x select 1;
				
				if (_item in shops_playerItems) then {
					_result = ["shops", _shopVarName, _item, _stock] call s_stats_write;
					if (_result) then {
						_savedCount = _savedCount + 1;
						diag_log formatText ["[SHOPS] Saved: shops/%1/%2 = %3", _shopVarName, _item, _stock];
					} else {
						diag_log formatText ["[SHOPS] FAILED to save: shops/%1/%2 = %3", _shopVarName, _item, _stock];
					};
				};
			}forEach _inv;
			
			_shop setVariable ["shop_needsSave", false, true];
			_shopCount = _shopCount + 1;
		};
	};
}forEach INV_ItemShops;

if (_savedCount > 0) then {
	diag_log formatText ["[SHOPS] Save complete: %1 stock entries saved from %2 shops to shops.ini", _savedCount, _shopCount];
} else {
	diag_log text "[SHOPS] No shops needed saving";
};

true
