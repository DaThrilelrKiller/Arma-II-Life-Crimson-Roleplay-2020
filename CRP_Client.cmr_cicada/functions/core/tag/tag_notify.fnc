private ["_text","_img","_display","_control","_h","_maxDist","_dist","_rsc","_target"];
disableSerialization;
_text = _this select 0;
_img = _this select 1;
_nodelay = _this select 2;
_nodelay = if (isNil "_nodelay")then {false}else{true};
_rsc = if (_nodelay)then {"tag_notify_nodelay"}else{"tag_notify"};

11 cutRsc [_rsc, "PLAIN"];

_display = (uiNamespace getVariable 'tag_notify');
_control = _display displayCtrl 54;	
		
if (_img != "")then 
{
	_control ctrlSetStructuredText parseText format["<t size='%2' align='center' color='%4' shadowColor='#000000'><img size='3' image='%5.paa'/><br/>%1</t>",_text,2, '#dfd7a5','#DDDDDD',_img];
}else{
	_control ctrlSetStructuredText parseText format["<t size='%2' align='center' color='%4' shadowColor='#000000'>%1</t>",_text,2, '#dfd7a5','#DDDDDD'];
};
		
_control ctrlShow true;
_control ctrlCommit 0;
