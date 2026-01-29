private ["_name","_log"];
if (isNil "admin_logs_array")then {admin_logs_array = []};
_name = _this select 0;
_name = if (isServer)then{"Server"}else{name _name};
_log = _this select 1;

admin_logs_array set [count admin_logs_array,[_name,_log,(_this select 2)]];
publicVariable "admin_logs_array";
