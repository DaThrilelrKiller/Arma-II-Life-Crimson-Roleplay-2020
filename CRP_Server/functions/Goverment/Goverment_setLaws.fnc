private ["_player","_nummer","_text","_governor"];

_player = _this select 0;
_nummer = _this select 1;
_text   = _this select 2;

if (_nummer == -1) exitWith {};
if ((_text call string_length) > 60) exitWith {
	[_player,["Law text is too long (max 60)."],{systemChat _this},false,false] call network_MPExec;
};

_governor = server getVariable ["governor",objNull];
if (isNull _governor || {_player != _governor}) exitWith {
	[_player,["Only the whitelisted Mayor (Governor) can change laws."],{systemChat _this},false,false] call network_MPExec;
};

GesetzArray SET [_nummer, _text];
publicVariable "GesetzArray";

["ALL",["dtk_client","Government",format["New law #%1: %2",(_nummer + 1),_text]],"Main_Notification",true,false]call network_MPExec;

