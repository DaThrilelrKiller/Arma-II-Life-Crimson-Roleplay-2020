private ["_data","_i","_unit","_votes","_message","_winner"];

for "_i" from 0 to 1 step 0 do {
	_data = call goverment_votes;
	_i = 0;

	{
		_unit = _x select 0;
		_votes = _x select 1;
		
		if (_votes > _i)then {
			_i = _votes;
			_winner = _x;
		};
		_unit setVariable["votes",nil,true];
	}forEach _data;

	if (isNil "_winner")then 
	{
		["ALL",["dtk_client","Elections",format["The elections for governor has ended %1 is sill governor, no one ran for governor",name call goverment_govonor]],"Main_Notification",true,false]call network_MPExec;

	}else
	{
		_message = format ["The elections for governor had ended %1 has won the election with %2 votes",name (_winner select 0),(_winner select 1)];
		server setVariable ["governor",(_winner select 0),true];
		["ALL",["dtk_client","Elections",_message],"Main_Notification",true,false]call network_MPExec;
		["ALL",[],{
			V_voted = false;
			player setVariable ["Votes",nil,true];
		},false,false]call network_MPExec;

	};
	sleep 900;
};