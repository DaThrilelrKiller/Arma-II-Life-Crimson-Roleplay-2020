private ["_data","_mode","_sorted","_tempData","_validData"];

_data = _this select 0;
_mode = _this select 1;

_validData = [];
{
	if (typeName _x == "ARRAY" && {count _x >= 4}) then {
		_validData set [count _validData, _x];
	} else {
		if (typeName _x == "STRING") then {
			private ["_parsed"];
			_parsed = call compile _x;
			if (typeName _parsed == "ARRAY" && {count _parsed >= 4}) then {
				_validData set [count _validData, _parsed];
			} else {
				diag_log formatText ["[SHOPS APP SORT] Invalid entry (string parse failed): %1", _x];
			};
		} else {
			diag_log formatText ["[SHOPS APP SORT] Invalid entry type: %1 (expected ARRAY)", typeName _x];
		};
	};
}forEach _data;

_data = _validData;
_sorted = _data;

switch (_mode) do {
	case "demand": {
		_tempData = [];
		{
			private ["_demand","_demandValue"];
			_demand = _x select 3;
			_demandValue = if (_demand == "High") then {3} else {if (_demand == "Medium") then {2} else {1}};
			_tempData set [count _tempData, [_demandValue, _x]];
		}forEach _data;
		_tempData = [_tempData, 0] call array_sortDescend;
		_sorted = [];
		{
			_sorted set [count _sorted, _x select 1];
		}forEach _tempData;
	};
	case "profit": {
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
		_tempData = [_tempData, 0] call array_sortDescend;
		_sorted = [];
		{
			_sorted set [count _sorted, _x select 1];
		}forEach _tempData;
	};
	case "stock": {
		_tempData = [];
		{
			_tempData set [count _tempData, [_x select 2, _x]];
		}forEach _data;
		_tempData = [_tempData, 0] call array_sortAscend;
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
