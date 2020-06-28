private ["_geld","_bank"];

if (dialog)exitWIth {closedialog 0};

if !(local_useBankPossible)  exitWith {systemChat"you must wait 5 minutes after robbing, to utlize a ATM"};

_geld = [player,"geld"] call storage_amount;
_geld = [_geld]call Main_FormatMoney;
_bank  = [dtk_bank] call Main_FormatMoney;

createDialog "atm_menu";

/* Addes your current data */
[2100, true] call dtk_PlayerListToControl;
CtrlSetText [1000, format ["Bank: %1$", _bank]];
CtrlSetText [1001, format ["Wallet: %1$", _geld]];

buttonSetAction [10, format["[call compile lbData [1, lbCurSel 1], ctrlText 2, ""deposit""]  execVM ""transact.sqf""; closedialog 0;"] ];
buttonSetAction [11, format["[ctrlText 6,                          0,          ""withdraw""] execVM ""transact.sqf""; closedialog 0;"] ];