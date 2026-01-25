private["_num", "_str", "_i", "_rest"];

_num = _this;
_str = "";

if (typeName _this == "STRING") then 

	{

	hint "Error: Wrong argument in IntToStr function: String";
	_str = _this;

	} else {

	if (_num >= 1000000) then 

		{

		_i   = 0;

		while {true} do 

			{

			_i    = _i + 1;
			_rest = (_num mod (10^_i));
			_num  = _num - _rest;
			_str  = format["%2%1", _str, (_rest/(10^(_i-1)))];
			if (_num <= 0) exitWith{};

			};

		} else {_str = format["%1", _num];};

	};

_str
