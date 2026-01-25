_Prams = _this select 0;
_Function = _this select 1;
_Function = if (typeName _Function == "CODE")then {_Function}else{missionNamespace getVariable[_Function,{}]};
_Sceduled = _this select 2;
_Jip = _this select 4;

if (_Sceduled)then 
{
	_Prams spawn  _Function;
}
else
{
	_Prams call _Function;
};

_this call network_log;
