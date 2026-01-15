private ["_c", "_result"];
	_result = 0;
	for "_c" from 0 to (count INV_ItemTypenArray - 1) do {
		if (((INV_ItemTypenArray select _c) select 0) == _this) exitWith {
			_result = ((INV_ItemTypenArray select _c) select 2);
		};
	};
	_result;