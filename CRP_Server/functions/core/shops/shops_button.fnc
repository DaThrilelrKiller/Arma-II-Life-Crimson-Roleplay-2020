private ["_amount","_text","_date","_item"];

_text = lbText [2100, (lbCurSel 2100)];

_text call { 
	_amount = parseNumber (ctrlText 12);

	if (_this == "Shop")exitWith {
		if (isNil "_amount")exitWith {};
		[_amount]call shops_Purchase;
	};
	if (_this == "Inventoy")exitWith {
		_date = call compile(lbData [301, (lbCurSel 301)]);
		_item = _date select 0;
		
		if (isNil "_amount")exitWith {};
		[_amount]call shops_sell;
	};
};
