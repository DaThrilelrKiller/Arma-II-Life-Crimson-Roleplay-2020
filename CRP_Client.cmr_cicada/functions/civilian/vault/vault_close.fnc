private ["_time"];

_time = time + 900;
waitUntil {
	sleep 1;
	(time > _time)
};
["ALL",[],{systemchat "The vault will be closting in 15 minutes!";},false,true]call network_MPExec;	

_time = time + 600;
waitUntil {
	sleep 1;
	(time > _time)
};

["ALL",[],{systemchat "The vault will be closting in 5 minutes!";},false,true]call network_MPExec;	

_time = time + 240;
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
this animate ["d_o_Anim",0]