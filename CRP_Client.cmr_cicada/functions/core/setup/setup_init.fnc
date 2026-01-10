private ["_total","_msg"];

_total = count DTK_INIT;
_msg = "";

{
	if (dtk_client)then {
		titleText [format["Loading %1 Module (%2 of %3) %4",(_x select 1),_forEachIndex,_total,_msg], "PLAIN",0];
		_msg = format ["%2 Module Complete\n %1",_msg,(_x select 1)];
	};
	
	if (typeName _x == "CODE")then {
		call _x;
	}else{
		call (_x select 0);
	};
}forEach DTK_INIT;

DTK_INIT = nil;

diag_log text "[LOG]Modules Initlization Finished!";