private ["_selection","_data","_index","_dataStr"];

_selection = lbCurSel 1500;
if (_selection == -1) exitWith {
	systemChat "Please select a loan application.";
};

_dataStr = lbData [1500, _selection];
_data = call compile _dataStr;
_index = _data select 1;

["SERVER",[player,"loan",_index],"S_credit_employeeApprove",false,false]call network_MPExec;

systemChat "Loan approval sent to server...";
sleep 1.5;
call credit_employee_refresh;
