disableSerialization;
private ["_stockData","_rawData"];

_rawData = if (typeName _this == "ARRAY" && {count _this > 0}) then {
	_this select 0
} else {
	_this
};

if (typeName _rawData == "STRING") then {
	_stockData = call compile _rawData;
} else {
	_stockData = _rawData;
};

if (isNil "_stockData" || {typeName _stockData != "ARRAY"}) then {
	_stockData = [];
	diag_log text "[SHOPS APP] ERROR: Received invalid stock data format";
} else {
	private ["_validData","_entry"];
	_validData = [];
	{
		if (typeName _x == "ARRAY" && {count _x >= 4}) then {
			_validData set [count _validData, _x];
		} else {
			diag_log formatText ["[SHOPS APP] WARNING: Invalid entry in stock data: %1 (type: %2)", _x, typeName _x];
		};
	}forEach _stockData;
	_stockData = _validData;
};

shops_app_stockData = _stockData;

diag_log formatText ["[SHOPS APP] Received %1 stock entries from server", count _stockData];

if (!isNull (findDisplay 114)) then {
	call shops_app_display;
} else {
	diag_log text "[SHOPS APP] Dialog not open, data cached for next open";
};

true
