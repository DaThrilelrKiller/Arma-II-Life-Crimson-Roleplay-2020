private ["_data","_type","_cost","_win","_winner"];

_data = call compile lbData [1, (lbCurSel 1)];

_type = _data select 0;
_cost = _data select 1;
_win  = _data select 2;

_winner    = random 5;

if (playing_lotto == 1 ) exitWith {systemChat  "You still need to scratch the one you have before buying another!";};

if !([player,"geld",-_cost]call storage_add) exitWith {
	systemChat  "You need more money to play!";
};

playsound "scratch";
playing_lotto = 1; 

for "_i" from 1 to 100 step 1 do {
	[format['Scratching Card... %1%2',_i,"%"],'data\images\tags\lotto',true]call tag_notify;
	sleep 0.08;
};


if (_winner > 1) exitWith {
	systemChat  format ["You lost on the ticket - (%1)",_lotto select 1];
	playing_lotto = 0;
};

["ALL",[player,"slotwin",7],"network_say3d",false,true]call network_MPExec;
[player,'geld',_win] call storage_add;

systemChat  format ["You won: $%1 on the (%2)!", _win, _type];
playing_lotto = 0;