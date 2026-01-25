private ["_selection","_data","_index"];

_selection = lbCurSel 1501;
if (_selection == -1) exitWith {
	systemChat "Please select a credit card application.";
};

_data = lbData [1501, _selection];
_data = call compile _data;
_index = _data select 1;

["SERVER",[player,"card",_index],"S_credit_employeeReject",false,false]call network_MPExec;

systemChat "Credit card rejection sent to server...";
sleep 1;
call credit_employee_refresh;
