private ["_wert", "_prozent", "_result"];
	_wert    = _this select 0;
	_prozent = _this select 1;
	_runden  = true;
	if (count _this > 2) then {_runden = _this select 2};
	if (_runden) then {
		_result  = round (  _wert + ((_wert / 100) * _prozent) );
	} else {
		_result  = (  _wert + ((_wert / 100) * _prozent)  );
	};
	_result;