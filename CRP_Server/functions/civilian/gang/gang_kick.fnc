private ["_kick","_gang","_text"];

/* 
this function is not complete 
ill finish this later, ;) invalid network target, easy fix if yall want to try
Network has no clue where to send the function
*/

_kick = (call compile lbData [2, lbCurSel 2]select 1);
_gang = player call gang_name;
_text = format ["%1 kicked you out of %2",name player, _gang];

[_kick,["dtk_client",_text,3],"network_chat",false,false]call network_MPExec;

closeDialog 0;
call gang_open;







