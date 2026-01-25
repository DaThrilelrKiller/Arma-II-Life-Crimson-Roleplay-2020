_control = _this select 0;
_index = _this select 1;

_data = _control lbData _index;

_text = if (_data == str player)then { "Run For Gov" }else{ "Elect" };
ctrlSetText [67, _text];