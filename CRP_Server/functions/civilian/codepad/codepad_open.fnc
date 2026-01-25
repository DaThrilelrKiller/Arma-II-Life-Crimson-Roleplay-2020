private ["_object"];

dtk_VaultObject = _this select 0;
createDialog "ARMAT1_CodePad";

dtk_VaultCode = [8,dtk_VaultObject] call codepad_getCode;
dtk_VaultAction = _this select 1;