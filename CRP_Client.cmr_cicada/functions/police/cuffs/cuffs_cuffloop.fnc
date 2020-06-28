
[_this,[player,dtk_dob],"id_show",false,false]call network_MPExec;

while {player getVariable "ar_cuffed" and alive player} do
{
	if (vehicle player == player)then
	{
		if (animationstate player != "actspercmstpsnonwrfldnon_interrogate02_forgoten")then
		{
			["ALL",[player,"actspercmstpsnonwrfldnon_interrogate02_forgoten"],"network_SwitchMove",false,true]call network_MPExec;
		};
	}
	else
	{
		if ((driver vehicle player) == player)then
		{
			(driver vehicle player) action ["getout", vehicle player];
		};
	};
	sleep 0.1;
};

["ALL",[player," "],"network_SwitchMove",false,true]call network_MPExec;