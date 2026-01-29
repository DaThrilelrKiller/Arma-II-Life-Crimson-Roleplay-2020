// Sort shops stock data
private ["_data","_mode","_sorted","_tempData"];

_data = _this select 0;
_mode = _this select 1;

_sorted = _data;

switch (_mode) do {
	case "demand": {
		// Sort by demand level (High > Medium > Low)
		_tempData = [];
		{
			private ["_demand","_demandValue"];
			_demand = _x select 3;
			_demandValue = if (_demand == "High") then {3} else {if (_demand == "Medium") then {2} else {1}};
			_tempData set [count _tempData, [_demandValue, _x]];
		}forEach _data;
		_tempData = [_tempData, 0] call core_sortArrayDescend;
		_sorted = [];
		{
			_sorted set [count _sorted, _x select 1];
		}forEach _tempData;
	};
	case "profit": {
		// Sort by profit margin (calculate on the fly, highest first)
		_tempData = [];
		{
			private ["_item","_shopVarName","_baseBuyPrice","_baseSellPrice","_adjustedBuyPrice","_adjustedSellPrice","_profitMargin","_itemInfo"];
			_shopVarName = _x select 0;
			_item = _x select 1;
			_itemInfo = _item call config_array;
			if (count _itemInfo > 0) then {
				_baseBuyPrice = _itemInfo call config_buycost;
				_baseSellPrice = _itemInfo call config_sellcost;
				_adjustedBuyPrice = ["SERVER", [_shopVarName, _item, _baseBuyPrice], "shops_getAdjustedPrice", false, false] call network_MPExec;
				_adjustedSellPrice = ["SERVER", [_shopVarName, _item, _baseSellPrice], "shops_getAdjustedPrice", false, false] call network_MPExec;
				if (isNil "_adjustedBuyPrice") then {_adjustedBuyPrice = _baseBuyPrice;};
				if (isNil "_adjustedSellPrice") then {_adjustedSellPrice = _baseSellPrice;};
				_profitMargin = _adjustedSellPrice - _adjustedBuyPrice;
				_tempData set [count _tempData, [_profitMargin, _x]];
			};
		}forEach _data;
		_tempData = [_tempData, 0] call core_sortArrayDescend;
		_sorted = [];
		{
			_sorted set [count _sorted, _x select 1];
		}forEach _tempData;
	};
	case "stock": {
		// Sort by stock level (lowest first - low stock = high demand)
		_tempData = [];
		{
			_tempData set [count _tempData, [_x select 2, _x]];
		}forEach _data;
		_tempData = [_tempData, 0] call core_sortArrayAscend;
		_sorted = [];
		{
			_sorted set [count _sorted, _x select 1];
		}forEach _tempData;
	};
	default {
		_sorted = _data;
	};
};

_sorted
