if ((_this select 0) == -1) exitWith {systemChat  localize "STRS_anim_noselect"};
if(vehicle player != player) exitWith {hint "You must be on foot"};


_index = _this select 0;
_data = dance_animations select _index;

_animname         = (_data select 0);
_animScriptName         = (_data select 2);
_animart          = (_data select 1);


if (_animart == "anim") then 
{					
	if (vehicle player == player) then 
	{
		["ALL",[player,_animname],"network_SwitchMove",false,true]call network_MPExec;
	};
	
} 
else 
{
	
	player playMoveNow _animname;
	
};
	
if (_animart == "playMoveNow") then 
{
	if (vehicle player == player) then 
	{
		player playMoveNow _animname;
	};
};
	
