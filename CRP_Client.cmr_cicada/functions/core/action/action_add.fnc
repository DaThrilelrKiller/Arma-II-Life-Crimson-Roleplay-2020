_object = _this select 0;
_prams = _this select 1;
_array = _object getVariable ["dtk_actions",[]];

_index = _object addAction _prams;
_array set [count _array,[_index,_prams]];

_object setVariable ["dtk_actions",_array];

count _array
