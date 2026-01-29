private ["_owner"];


_owner = _this getVariable ["dtk_owner",""];
_owner = if (_owner == name player)then {true}else{false};
_owner