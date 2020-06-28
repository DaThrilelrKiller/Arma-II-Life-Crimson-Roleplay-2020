private["_arr", "_i", "_num", "_isNumber", "_KommataCount", "_result", "_reString"];

_isNumber = true;
_result   = -1;	
_reString = "";

if ((typeName _this) == "STRING") then 

	{

	_KommataCount = 0;
	_arr          = _this call string_toArray;
	for [{_i=0}, {_i < (count _arr)}, {_i=_i+1}] do 

		{

		_num = _arr select _i;
		if (_num == ",") then { _arr SET[_i, "."]; _num = "."; };
		if (_num == ".") then { _KommataCount = _KommataCount + 1;};
		
		if (((!(_num in ISSE_str_const_StringNum)) and ((_num != "-") and (_i == 0)) ) or (_KommataCount > 1)) exitWith 

			{

			_isNumber = false;

			};

		};

	_reString = _arr call string_arrayToString;

	if (_reString == "") exitWith {_isNumber = false;};
	if (_isNumber) exitWith {_result = parseNumber(_reString);};

	} 
	else 
	{

	if ((typeName _this) == "SCALAR") then {_isNumber = true;_result   = _this;} else {_isNumber = false;};	

	};

	[_isNumber, _result]
