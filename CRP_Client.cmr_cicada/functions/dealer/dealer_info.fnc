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
		
	_image = getText (configFile >> "CfgVehicles" >> _type >> "Picture");
	_name = getText(configFile >> "CfgVehicles" >> _type >> "displayname");
	_speed = _target getVariable["tuning",0];
	_trunk = [_target]call storage_maxkg;
	_price = _sellData select 1;
	_GPS = false;
	_seller = _sellData select 0;
	_painted = _target getVariable ["textures",""];
	_painted = if (typeName _painted == "ARRAY")then{"Yes"}else{"No"};
	
	
	_control ctrlSetStructuredText parseText format["
	<t size='2' align='center' color='%4' shadowColor='#000000'>
	
	<img size='2' image='%1'/>Buy (E)<br/>
	%2<br/>
	Seller: %7<br/>
	<img size='2' image='\crp_data\images\items\money.paa'/>%5<br/>
	<img size='2' image='\crp_data\images\items\exhaust.paa'/>%3<br/>
	<img size='2' image='\crp_data\images\tags\storage.paa'/>%4<br/>
	<img size='2' image='\crp_data\images\tags\pin.paa'/>%6<br/>
	<img size='2' image='\crp_data\images\tags\paint.paa'/>%8<br/>
	</t>",_image,_name,_speed,_trunk,[_price]call main_formatMoney,_gps,_seller,_painted];
		
			
    _control ctrlShow true;
    _control ctrlSetPosition [(_pos select 0)-0.125,_pos select 1];
    _control ctrlCommit 0;
		
	if (isNil "t_info_handler" || {scriptDone t_info_handler})then {
		t_info_handler = [_target,_control]spawn tag_handler;
	};
};

if(!alive _target)then{_target removeAction (_target getVariable 'tag')};
false