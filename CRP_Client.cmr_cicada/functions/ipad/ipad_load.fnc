private ["_info","_pic","_act","_ui","_control","_appId"];
disableSerialization;
{
_appId = _x;

// Skip judge app if player is not a judge
if (_appId == "app_judge" && !(call court_isJudge)) then {
	// Hide the app button
	_ui = uiNameSpace getVariable "ipad";
	_control = _ui displayCtrl (100 + _ForEachIndex);
	_control ctrlShow false;
} else {
	_info = _x call ipad_apps;
	_pic = _info select 1;
	_act = _info select 2;

	_ui = uiNameSpace getVariable "ipad";
	_control = _ui displayCtrl (100 + _ForEachIndex);
	_control  ctrlSetTooltip (_x call config_displayname);
	_control ctrlShow true;

	ctrlSetText [_ForEachIndex,_pic];
	buttonSetAction [(100 + _ForEachIndex),_act];
};
}forEach INVAppsInstalled;