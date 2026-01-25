private ["_name"];

_name = [name player,"[]"]call string_split;
_name = _name select (count _name) - 1;
_name = if (_name != "")then{_name}else{name player};
_name