

if (processscriptrunning == 1) exitwith {
	systemChat  "We're Working as fast as we can. Please wait till we are done before giving us another task";
}; 

processscriptrunning = 1;

 _this = _this select 3;
 _item1 = _this select 0;
 _item2 = _this select 1;
 _req = _this select 2;
 _license = _this select 3;
 _nitem1 = [player,_item1] call storage_amount;
 _name1 = _item1 call config_displayname;
 _name2 = _item2 call config_displayname;
 
if !(_license call licenses_has)exitwith{
	systemchat format ["You need a %1 Licence to process %2",_license call licenses_name,_name1];
	processscriptrunning = 0;
};

_multi = floor(_nitem1/_req); 
_total = _req*_multi;  
[player,_item1,-_total] call storage_add;
[player,_item2,_multi] call storage_add;
systemChat  format["%1 %2 was processed into %3 %4!", _total, _name1, _multi, _name2];
processscriptrunning = 0; 


