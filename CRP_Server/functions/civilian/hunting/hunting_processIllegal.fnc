hunting_processIllegal = {
private ["_data","_item1","_item2","_req","_nitem1","_name1","_name2","_multi","_total","_num"];

if (processscriptrunning == 1) exitWith {
	systemChat "Processing already in progress...";
};
processscriptrunning = 1;

if (dtk_cop) exitWith {
	systemChat "Only Civilians Can Do This!";
	processscriptrunning = 0;
};

_data = _this;
_item1 = _data select 0;
_item2 = _data select 1;
_req = _data select 2;

_nitem1 = [player,_item1] call storage_amount;
_name1 = _item1 call config_displayname;
_name2 = _item2 call config_displayname;

if (_nitem1 < _req) exitWith {
	systemchat format ["You need at least %1 %2 to process",_req,_name1];
	processscriptrunning = 0;
};

_multi = floor(_nitem1/_req); 
_total = _req*_multi; 
[player,_item1,-_total] call storage_add;
[player,_item2,_multi] call storage_add;

_num = round random 100;
if (_num < 25) then {
	[player,"Poaching",50000]call cdb_addWarrant;
	["ALL",["dtk_client",format["%1 has been reported for illegal poaching activities!",name player],3],"network_chat",false,true]call network_MPExec;
};

systemChat format["%1 %2 Was Processed Into %3 %4!", _total, _name1, _multi, _name2];
processscriptrunning = 0;
};