private ["_object","_message1"];
_object = _this select 0;
_name = _this select 1;


while {robbing} do
{
	if (player distance _object >= 5) exitWith 
	{
		systemChat  "You are gone to far away from the Cashier and he has called the cops!.";
		_message1 = format ['Someone left %1 mid robbery and the owner has called 911! And locked the cash register!', _name];
		["ALL",["dtk_cop","Police Dispatch",_message1],"Main_Notification",true,false]call network_MPExec;
		_object setVariable ["robbery_money",0,true];
		robbing = false;
	};
	sleep 1;
};