private ["_client"];
_client = _this select 0;

[_client,date,{setDate _this},false,false]call network_MPExec;
