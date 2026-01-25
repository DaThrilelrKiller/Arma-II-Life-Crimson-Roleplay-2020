private ["_selection","_data","_index"];

_selection = lbCurSel 1500;
if (_selection == -1) exitWith {
	systemChat "Please select a loan application.";
};

_data = lbData [1500, _selection];
_data = call compile _data;
_index = _data select 1;

["SERVER",[player,"loan",_index],"S_credit_employeeReject",false,false]call network_MPExec;

systemChat "Loan rejection sent to server...";
sleep 1;
call credit_employee_refresh;
