private ["_house","_text","_return"];

_house = _this select 0;

_text = markerText _house;
_return = if (_text != "")then {true}else{false};
_return 