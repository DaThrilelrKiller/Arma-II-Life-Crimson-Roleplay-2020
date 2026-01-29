private ["_info","_pic","_act","_ui","_control"];
disableSerialization;
{
_info = _x call ipad_apps;
_pic = _info select 1;
_act = _info select 2;

_ui = uiNameSpace getVariable "ipad";
_control = _ui displayCtrl (100 + _ForEachIndex);
_control  ctrlSetTooltip (_x call config_displayname);

ctrlSetText [_ForEachIndex,_pic];
buttonSetAction [(100 + _ForEachIndex),_act];
}forEach INVAppsInstalled;