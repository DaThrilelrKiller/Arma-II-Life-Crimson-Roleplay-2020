private ["_art","_player"];

_art = _this select 0;
_player = cursorTarget;

if !(isPLayer _player)exitWith {systemChat "You are not looking at a player to blindfold"};

if !(isNil '_art') then 
{
	format['if (player == %1)then {titleText ["You are blindfolded by %2", "BLACK"];};',_player,(name player)]call network_broadcast;
	_player setVariable ["blindfolded",true, true];
	[player,"blindfold",-1] call storage_add;
}
else
{
	format['if (player == %1)then {titleText ["", "PLAIN"];};',_player]call network_broadcast;
	_player setVariable ["blindfolded",false, true];
	[player,"blindfold",1] call storage_add;
};
