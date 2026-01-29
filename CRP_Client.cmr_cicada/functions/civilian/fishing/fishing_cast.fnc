private ["_type","_pos","_size","_time","_chance","_amount","_name"];

if (v_casting)exitWith {
systemchat "You already are casting";
};
v_casting = true;

if !(surfaceIsWater getPos player)exitWith {
systemchat format ["%1 you must be in water to fish",name player];
};

["ALL",[player,"AwopPercMstpSgthWnonDnon_end"],"network_SwitchMove",false,true]call network_MPExec;

_type = {
	_pos = _x select 1;
	_size = _x select 2 select 0;

	if (player distance _pos < _size)exitWith {[_x select 0]};
	fishing_array

}ForEach fishing_spots;

v_fishing_inspot = if (count _type > 1)then {false}else{true};

_type = _type call BIS_selectRandom;
_time = time + (round (random 15) + 5);

while {time < _time} do {
["Nibble...",'data\images\items\fishing-pole']call tag_notify;
sleep round (random 4);
};

_chance = _type call fishing_chance;
_amount = round ([0,_chance]call core_random);

if (_amount == 0)then {
	["Nothing Caught...",'data\images\items\fishing-pole']call tag_notify;
}else
{	
	_name = _type call config_displayname;
	[format ["You have caught %1 %2",_amount,_name],'\sfg_textures\items\fishing-pole']call tag_notify;
	[player,_type,_amount] call storage_add
};

v_casting = false;

