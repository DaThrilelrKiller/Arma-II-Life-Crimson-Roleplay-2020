private ["_unit"];

if (lifeState player == "UNCONSCIOUS" or !alive player)exitWith {};

if((vehicle player == player) && INV_isArmed) then 
{
	if (dtk_stunning)exitWith {};
	_unit = nearestobjects [getposatl player, ["Man"], 2] - [player];
	_unit spawn 
	{
		["ALL",[player,"AwopPercMstpSgthWnonDnon_end"],"network_SwitchMove",false,true]call network_MPExec;
		sleep 0.2; 
		if(count _this > 0) then 
		{
			_unit = _this select 0;
			if(_unit distance player > 2)exitwith{};
			dtk_stunning = true;
			[_unit,[player],{["hit", (_this select 0), "Melee", 1] execVM "scripts\stun.sqf"},false,false]call network_MPExec;
			systemchat"you stunned this player!";		 
		};
		sleep 5;
		dtk_stunning = false;
	}; 
};