private ["_text","_img","_display","_control","_h","_pos","_maxDist","_dist","_name","_target"];

if (dialog)exitWith{false};

disableSerialization;
_target = _this select 0;

_display = (uiNamespace getVariable 'tag');
_control = _display displayCtrl 54;

_box = boundingBox _target;
_p1 = _box select 0;
_p2 = _box select 1;
_h = abs ((_p2 select 2) - (_p1 select 2));
_h = if (_h > 2)then{2}else{_h};

_p = getPosATL _target;
_pos = worldToScreen [_p select 0, _p select 1,_h];
_maxDist = 10;
_dist = round (_target distance player);
        
if( _maxDist > _dist &&  {alive _target} && {count _pos > 0})then{

	_type = typeOf _target;
	_sellData = _target getVariable ["Dealer_Data",1000];
		
	_displayName = getText(configFile >> "CfgVehicles" >> _type >> "displayname");
	_speed = round speed _target;
	_name = name(driver _target);
	
	_displayName2 = getText(configFile >> "CfgVehicles" >> _type >> "displayname");
	_speed2 = round speed _target;
	_name2 = name(driver _target);
	
	
	_control ctrlSetStructuredText parseText format["
	<t size='1.3' align='center' color='%4' shadowColor='#000000'>
	%1<br/>
	%2<br/>
	%3<br/><br/>
	%4<br/>
	%5<br/>
	%6<br/>
	</t>",_displayName,_name,_speed,,_displayName2,_name2,_speed2];
		
			
    _control ctrlShow true;
    _control ctrlSetPosition [(_pos select 0)-0.125,_pos select 1];
    _control ctrlCommit 0;
		
	if (isNil "t_info_handler" || {scriptDone t_info_handler})then {
		t_info_handler = [_target,_control]spawn tag_handler;
	};
};

if(!alive _target)then{_target removeAction (_target getVariable 'tag')};
false