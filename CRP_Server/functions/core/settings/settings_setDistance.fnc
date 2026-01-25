private ["_control","_newValue"];

_control = _this select 0;
_newValue = round(_this select 1);

setViewDistance _newValue;

ctrlSetText [5,format["View Distance: %1",_newValue]];
