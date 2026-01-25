private ["_type", "_item", "_result"];
	_type = _this call config_type;
	_cost = _this call config_buycost;
	[_cost, (_type call INV_GetObjectSteuer)] call INV_AddProzent;