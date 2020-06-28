private ["_prams","_function","_sceduled","_name"];

_prams = (_this select 0);
_function = (_this select 1);
_sceduled = (_this select 2);
_name = (_this select 3);

[format["[Network packet] From: %4 Prams:%1 Function:%2 Sceduled:%3",_prams,_function,_sceduled,_name],'#0010']call log_write;