
[_this,[player,dtk_dob],"id_show",false,false]call network_MPExec;

while {_this getVariable "ar_cuffed" and alive _this} do
{
	if (vehicle _this == _this)then
	{
		if (animationstate _this != "actspercmstpsnonwrfldnon_interrogate02_forgoten")then
		{
			["ALL",[_this,"actspercmstpsnonwrfldnon_interrogate02_forgoten"],"network_SwitchMove",false,true]call network_MPExec;
		};
	}
	else
	{
		if ((driver vehicle _this) == _this)then
		{
			(driver vehicle _this) action ["getout", vehicle _this];
		};
	};
	sleep 0.1;
};

["ALL",[_this," "],"network_SwitchMove",false,true]call network_MPExec;
["ALL",[player," "],"network_SwitchMove",false,true]call network_MPExec;