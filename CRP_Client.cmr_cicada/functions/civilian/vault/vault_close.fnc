private ["_time"];

_time = time + 60;
["ALL",[],{systemchat "The vault will be closting in 5 minutes!";},false,true]call network_MPExec;	
waitUntil {
	sleep 1;
	(time > _time)
};

["ALL",[],{systemchat "The vault will be closting in 4 minutes!";},false,true]call network_MPExec;	

_time = time + 60;
waitUntil {
	sleep 1;
	(time > _time)
};

["ALL",[],{systemchat "The vault will be closting in 3 minutes!";},false,true]call network_MPExec;	
_time = time + 60;
waitUntil {
	sleep 1;
	(time > _time)
};

["ALL",[],{systemchat "The vault will be closting in 2 minutes!";},false,true]call network_MPExec;	

_time = time + 60;
waitUntil {
	sleep 1;
	(time > _time)
};

["ALL",[],{systemchat "The vault will be closting in 1 minutes!";},false,true]call network_MPExec;	

_time = time + 60;
waitUntil {
	sleep 1;
	(time > _time)
};
_this animate ["d_o_Anim",0];
