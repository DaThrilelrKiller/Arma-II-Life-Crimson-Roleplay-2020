private ["_invite","_gang","_text"];

/* get needed info for person you are inviting */
_invite = (call compile lbData [4, lbCurSel 4]select 1);
_gang = player call gang_name;
_text = format ["%1 invited you to join %2",name player, _gang];

/* sends invite to client*/
[_invite,["dtk_client",_text,3],"network_chat",false,false]call network_MPExec;
[_invite,_gang,{dtk_gang_invites set [count dtk_gang_invites,_this]},false,false]call network_MPExec;








