private ["_o","_nubmerofplayers","_sleeptime","_units"];

for "_o" from 0 to 1 step 0 do 
{
	_units = playableUnits;
	_nubmerofplayers = count _units;
	_sleeptime = if (_nubmerofplayers < 1)then {180}else{(180/_nubmerofplayers)};
	{
		[_x,[],"Stats_Save",false,false]call network_MPExec;
		sleep 0.5;
		[_x,[],"experience_save",false,false]call network_MPExec;
		sleep _sleeptime;
	}count _units;

};