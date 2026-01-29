private ["_shopData"];
_shopData = _this getVariable "shop_data";
if (count _shopData > 0) then {
	_shopData select 0  // Return the shop object
} else {
	_this  // Fallback: return the shop object itself if shop_data is empty
} 