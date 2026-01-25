/*
File: fn_revive.sqf
Desc: Used to revive players that are down
Author: DaThrillerKiller -PureGaming Founder
Youtube: https://www.youtube.com/channel/UCY-d_qX9l2ABnJ3cDO7VUIQ
Email: dathrillerkiller@gmail.com 
Instagram: https://www.instagram.com/tuckeeeee

	Use Without Permission is prohibited

Prams: 
	0. Player you are trying to revive
*/

private ["_Deadplayer","_LifePack"];

_Deadplayer = _this select 0;
['ALL',_Deadplayer,{_this allowDamage true;},false,true]call network_MPExec;
['ALL',_Deadplayer,{_this setUnconscious false;},false,true]call network_MPExec;
_Deadplayer setUnconscious false;
_Deadplayer allowDamage true;

LifePack = "lifepak" createVehicle getPos player;
LifePack attachTo [_Deadplayer, [-0.4, 0.9, 0.2]];
LifePack setDir 220;
LifePack animate ["AEDFront", 1];

player attachTo [_Deadplayer, [-0.666, 0.222, 0]];
player setDir 90;

player playMoveNow "AinvPknlMstpSnonWrflDnon_medic";
sleep 5;
player playMove format ["AinvPknlMstpSnonWrflDnon_medic%1", floor random 6];
sleep 5;
player playMove format ["AinvPknlMstpSnonWrflDnon_medic%1", floor random 6];
sleep 5;
player playMoveNow "AinvPknlMstpSnonWrflDnon_medicEnd";

detach _Deadplayer;
detach _LifePack;
detach player;

["ALL",[_Deadplayer,"amovppnemsprslowwrfldf"],"network_SwitchMove",false,true]call network_MPExec;
deleteMarker ("medical_" + name _Deadplayer);

LifePack animate ["AEDFront", 0];;
waitUntil {LifePack animationPhase "AEDFront" == 0};
deleteVehicle LifePack;

_msg = format ["%1 was revived by %2",name _Deadplayer,name player];
["ALL",_msg,{systemchat _this},false,true]call network_MPExec;
[player,"geld",100] call storage_add;
