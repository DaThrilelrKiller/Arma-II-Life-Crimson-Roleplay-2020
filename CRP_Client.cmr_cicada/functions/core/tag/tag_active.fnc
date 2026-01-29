private ["_display","_control"];

disableSerialization;

_display = (uiNamespace getVariable 'tag');
_control = _display displayCtrl 54;	

((ctrlText _control) != "")