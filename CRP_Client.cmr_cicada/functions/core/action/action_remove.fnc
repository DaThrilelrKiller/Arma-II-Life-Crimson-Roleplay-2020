
_object = _this select 0;
_index = _this select 1;
_array = _object getVariable ["dtk_actions",[]];

_object removeAction _index;
_array set [_index,""];

while {"" in _array}do {
	_array = _array - [""];
};

_object setVariable ["dtk_actions",_array];
