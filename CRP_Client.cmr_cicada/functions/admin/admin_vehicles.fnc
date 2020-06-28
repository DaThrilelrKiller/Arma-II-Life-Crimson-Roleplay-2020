createDialog "admin_vehicles";
admin_selected = 6;
[2100, true] call dtk_PlayerListToControl;
call admin_load;

"vehicle" call admin_loadFromConfig;

disableserialization;
_ui = uiNameSpace getVariable "admin_vehicles";
_Main = _ui displayCtrl 1501;
lbSort _Main;