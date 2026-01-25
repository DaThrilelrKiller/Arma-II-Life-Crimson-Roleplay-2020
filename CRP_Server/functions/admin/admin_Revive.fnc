private ["_to"];

_to = (call compile lbData [2100, lbCurSel 2100]select 1);

[_to,["true",format ["You have been revived by: %1", name player],3],"network_chat",false,false]call network_MPExec;

["ALL",_to,{_this setUnconscious false;},false,true]call network_MPExec;
["ALL",_to,{_this allowDamage true;},false,true]call network_MPExec;
["ALL",[_to,"amovppnemsprslowwrfldf"],"network_SwitchMove",false,true]call network_MPExec;
deleteMarker ("medical_" + name _to);
call medical_terminate; 