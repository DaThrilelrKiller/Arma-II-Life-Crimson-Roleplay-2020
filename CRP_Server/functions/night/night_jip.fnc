[(_this select 0),[0.5,{_skip = [0.002,0.009]select call night_time;skipTime _skip;}],"core_AddLoop",false,false]call network_MPExec;
["ALL",date,{setDate _this},false,true]call network_MPExec;