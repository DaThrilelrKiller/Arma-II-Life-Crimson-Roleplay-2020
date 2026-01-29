private["_amount", "_result"];
	_amount = _this select 0;
	
	_result = format['$%1', ([_amount, ","] call Main_format_integer)];
	
	_result