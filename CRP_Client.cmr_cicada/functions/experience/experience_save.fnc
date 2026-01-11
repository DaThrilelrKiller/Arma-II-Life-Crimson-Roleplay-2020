

_savedTime = missionNameSpace getVariable [format["DTK_%1Time",dtk_side],0];
_playTime = round((time - DTK_JoinTime) + _savedTime);


_save = [
    player,dtk_side,_playTime
]

["SERVER",_save,"S_experience_save",false,false]call network_MPExec;
