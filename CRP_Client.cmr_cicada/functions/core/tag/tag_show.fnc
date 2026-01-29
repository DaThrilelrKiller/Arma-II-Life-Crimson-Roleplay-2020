private ["_text","_img","_display","_control","_pos","_dist","_name","_target"];

if (dialog)exitWith{false};

disableSerialization;
_target = _this select 0;
_text = _this select 1;
_img = _this select 2;

_display = (uiNamespace getVariable 'tag');
_control = _display displayCtrl 54;

_pos = _target call tag_screenPos;

_dist = round (_target distance player);
        
if( 10 > _dist && {count _pos > 0})then{

		_name = 
		if (_img != "")then 
		{
			_control ctrlSetStructuredText parseText format["<t size='%2' align='center' color='%4' shadowColor='#000000'><img size='3' image='%5.paa'/><br/>%1</t>",_text,2, '#dfd7a5','#DDDDDD',_img];
		}else{
			_control ctrlSetStructuredText parseText format["<t size='%2' align='center' color='%4' shadowColor='#000000'>%1</t>",_text,2, '#dfd7a5','#DDDDDD'];
		};
			
        _control ctrlShow true;
        _control ctrlSetStructuredText _name;
        _control ctrlSetPosition [(_pos select 0)-0.125,_pos select 1];
        _control ctrlCommit 0;
		
		if (isNil "t_tag_handler" || {scriptDone t_tag_handler})then {
			t_tag_handler = [_target,_control]spawn tag_handler;
		};
		
    };

if(!alive _target)then{_target removeAction (_target getVariable 'tag')};
false