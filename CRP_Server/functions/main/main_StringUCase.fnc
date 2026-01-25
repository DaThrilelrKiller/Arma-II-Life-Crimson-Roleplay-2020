	private["_text", "_chararr", "_i", "_curchar", "_result"];
	_text = _this select 0;
	_result = "";
	
	if (_text == "") exitWith {_result};
	
	_chararr = toArray _text;
	
	for [{_i=0}, {_i < (count _chararr)}, {_i=_i+1}] do {
		_curchar = _chararr select _i;
		
		if (_curchar >= 97 && _curchar <= 122) then {
			_chararr set [_i, (_curchar + 65 - 97)];
		};
	};
	
	_result = toString _chararr;
	
	_result