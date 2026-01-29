

if (processscriptrunning == 1) exitwith { systemChat  "We're Working as fast as we can. Please wait till we are done before giving us another task";
spamcount = spamcount + 1; 
if (spamcount == 5) then {systemChat "I have spammed the Process script 5 times, ignoring the text that tells me I cannot run this script multiple times"};
if (spamcount == 10) then {systemChat "I have spammed the Process script 10 times, ignoring the text that tells me I cannot run this script multiple times"};
}; 
processscriptrunning = 1;

_num = round random 100;

if(dtk_cop)exitwith{systemChat  "Only Civilians Can Do This!"; processscriptrunning = 0;};
 _this = _this select 3;
 _item1 = _this select 0;
 _item2 = _this select 1;
 _req = _this select 2;
 _license = _this select 3;
 _nitem1 = [player,_item1] call storage_amount;
 _name1 = _item1 call config_displayname;
 _name2 = _item2 call config_displayname;

	if (_num < 10)exitwith
	{
		_bomb = "Bo_GBU12_LGB" createVehicle (position player);
		processscriptrunning = 0;
		["ALL",["dtk_client","A Meth Lab Has Exploded And Killed Numerous Citizens!",3],"network_chat",false,true]call network_MPExec;
	};


 _multi = floor(_nitem1/_req); 
_total = _req*_multi; 
[player,_item1,-_total] call storage_add;
[player,_item2,_multi] call storage_add;
systemChat  format["%1 %2 Was Processed Into %3 %4!", _total, _name1, _multi, _name2];
processscriptrunning = 0; 
