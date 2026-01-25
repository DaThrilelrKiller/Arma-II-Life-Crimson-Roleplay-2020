
if (time > v_questtime)then {
	i_quest call core_removeLoop;
	v_questitems = [];
	v_questtime = 0;
	["true","Quest","Your quest has ended"]call Main_Notification;
}else{
	["true","Quest",format["You have %1 left, rember you can use the commands !quest to veiw your quest infomation",[(v_questtime - time)]call BIS_timeToString]]call Main_Notification;
};

