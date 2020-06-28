private ["_minearray","_isInArea","_amount","_resource","_max","_infos","_name","_itemweight","_pos","_object","_class","_icon"];
if(working)exitwith{systemChat  "You are collecting a resource, please wait";};
working=true;
_this = _this select 3;

_minearray = {
	if (player distance (getMarkerPos ((_x select 0) select 0)) < ((_x select 0) select 1) && dtk_civ) exitwith {
		_x
	};
	[]
}forEach miningarray;


_isInArea = if (count _minearray > 0)then {true}else{false};
_amount = floor (random 2)+1;

if (!isNil "_this")then {
	_isInArea = true;
	_resource = "Oil";
	_max = 12;
}else{
	_resource = _minearray select 1;
	_max      = _minearray select 2;
};

_infos    = _resource call config_array;
_name     = (_infos call config_displayname);
_itemweight = (_infos call config_weight)*_amount;
_class = "Suitcase";
_icon = format ["\CRP_data\images\items\%1",[_resource]call config_image];


if (_isInArea) exitwith {
	for [{_i=0}, {_i < (floor(random 5))}, {_i=_i+1}] do 
	{
		titletext ["Machine Running...", "PLAIN DOWN", 1];
		sleep 5;
		titletext [format ["The Machine has collected %1!", _resource], "PLAIN"];
		systemChat  format["There is %1 %2s on the ground collect them.", _amount, _name];

		_pos = getposASL player;
		_object = _class createvehicle (position player);
		_object setPos [ getPos _object select 0, (getPos _object select 1)+4, (getPos _object select 2)];
			
		_object call core_setVarName; 
		["ALL",[_object,['','noscript.sqf',format['%1 spawn items_pickup',[_object, _resource, _amount]],25,false,true,'LeanRight',format ['player distance _target < 5 && {!([_target,"Pick up %1 (E)","%2"]call tag_show)}',_name,_icon]]],"network_addAction",false,true]call network_MPExec;
		titletext ["Restart the machine it has shut down...", "PLAIN DOWN", 3];
	};
	working=false;
};

systemChat  "You are not near a resource area.";

