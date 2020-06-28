private ["_object","_data","_prams"];

_object = _this select 0;
_object = if (typeName _object != "STRING")then {_object}else{call compile _object};
_data = _this select 1;

_prams = [_object,"core_addAction",[_object,_data]];

if (dtk_server)exitWith {
	DTK_Sync set[count DTK_Sync,_prams]; 
};

_object addAction _data;