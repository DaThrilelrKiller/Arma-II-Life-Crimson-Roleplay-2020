private ["_selection","_data","_index","_dataStr"];

_selection = lbCurSel 1501;
if (_selection == -1) exitWith {
	systemChat "Please select a credit card application.";
};

_dataStr = lbData [1501, _selection];
_data = call compile _dataStr;
_index = _data select 1;

["SERVER",[player,"card",_index],"S_credit_employeeApprove",false,false]call network_MPExec;

systemChat "Credit card approval sent to server...";
sleep 1.5;
call credit_employee_refresh;
