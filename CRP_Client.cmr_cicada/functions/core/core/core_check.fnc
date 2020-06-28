
dtk_LagCount = 0;

for "_i" from 0 to 1 step 0 do {
	dtk_TimeLog = diag_tickTime;
	sleep 3;
	dtk_LagTime = (diag_tickTime - dtk_TimeLog) - 3;
	if (dtk_LagTime > 1)then{
		dtk_LagCount = dtk_LagCount + 1;
		if (dtk_LagCount > 20)then{
			if (dtk_server)then{
				["ALL",["dtk_client",format["Server is experiencing sceduler lag of %1s",dtk_LagTime],3],"network_chat",false,false]call network_MPExec;
			}else{
				systemchat format["Client is experiencing sceduler lag of %1s, posible relog may fix the issue",dtk_LagTime];
			};
			dtk_LagCount = 0;
		};
	};
};
