private ["_message"];
if ((SwagDevs) or (Sgt_id) or EMTBasic_id) then
{
    _message = format["%1 has cleared a checkpoint (100m).", name player];
	["ALL",["dtk_cop",_message,2],"network_chat",false,true]call network_MPExec;
    {
        if((_x getVariable "AM_CP") == 1) then 
       	{
            deleteVehicle _x;
        };
    }count nearestObjects[player,["All"],100];
}else{
	_message = format["%1 Has Attempted To Clear A Checkpoint (100m). This Can Only Be Done By Holding The Proper Rank!", name player];
	["ALL",["dtk_cop",_message,2],"network_chat",false,true]call network_MPExec;
};