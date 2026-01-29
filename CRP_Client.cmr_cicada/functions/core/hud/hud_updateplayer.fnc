private ["_hud","_playhud","_vcl","_vclClass","_storweight","_maxweight","_stor","_health"];

_hud = uiNameSpace getVariable "ar_hud";
_playhud = _hud displayCtrl 154;

_hunger = round(100-dtk_hunger);
_invmoney = [[player,"geld"] call storage_amount] call Main_FormatMoney;
_bankmoney = [(dtk_bank)] call Main_FormatMoney;
_health = 100 - (round ((damage player)*100));

_playhud ctrlSetText format [ " Hunger: %1 | Health: %2 | Cash: %3 | Bank: %4 | FPS: %5 " ,_hunger ,_health ,_invmoney ,_bankmoney,round diag_fps ];
_playhud ctrlCommit 0;