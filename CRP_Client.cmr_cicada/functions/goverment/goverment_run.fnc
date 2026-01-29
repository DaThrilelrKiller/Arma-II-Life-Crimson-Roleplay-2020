if (!dtk_civ)exitwith {
	systemchat "Only civilains can run for Prime Minister";
};

private ["_data","_string"];

_data = call goverment_votes;
_string = "";

player setVariable["votes",1,true];

{
	_string = format ["%1 %2,",_string,name (_x select 0)];
}forEach _data;

["ALL",["dtk_client","Elections",format ["%1 is now running for govonor, against %2",name player,_string]],"Main_Notification",false,true]call network_MPExec;
V_voted = true;

closedialog 0;