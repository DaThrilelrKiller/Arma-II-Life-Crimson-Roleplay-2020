_display = (uiNamespace getVariable 'tag_notify');
_control = _display displayCtrl 54;	
disableSerialization;

while {true} do
	_control ctrlSetPosition tag_pos;
	_control ctrlCommit 0;
	!isNull _display
};