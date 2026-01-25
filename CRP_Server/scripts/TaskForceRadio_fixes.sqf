TFAR_fnc_objectSide = {
	_object = _this;
	_static = false;
	if (typeName _object == "ARRAY") then {
		_object = (_this select 0);
		if (count _this > 1) then {_static = _this select 1};
	};

};