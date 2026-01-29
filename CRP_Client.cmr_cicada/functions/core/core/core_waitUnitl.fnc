_variable = _this select 0;
_text  = _this select 1;
_return = isNil _variable;


if (_return)then {
call _text;
};

_return