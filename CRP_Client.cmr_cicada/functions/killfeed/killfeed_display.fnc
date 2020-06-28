private ["_control","_unit","_killer","_text","_display","_message"];
_unit = _this select 0;
_killer = _this select 1;

if (_unit == _killer)exitWith {};
if (dtk_server)exitWith {};
if !(isPlayer _unit)exitWith {};

_this call killfeed_add;

_text = "";

15 cutRsc ["kill_feed", "PLAIN"];
_display = (uiNamespace getVariable 'kill_feed');
_control = _display displayCtrl 3600;

_message = _this call killfeed_message;
kill_feed set [count kill_feed,_message];

{_text = _text + _x}forEach kill_feed;
["kill_feed",3]call array_trim;

_control ctrlSetStructuredText parseText _text;
_control ctrlCommit 0;