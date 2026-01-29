/*set variable of inventoy*/
private ["_object","_array","_public"];

_object = _this select 0;
_array = _this select 1;
_public = if (_object in dtk_storage_local)then {false}else{true};

_object setVariable ["dtk_storage",_array,_public];
