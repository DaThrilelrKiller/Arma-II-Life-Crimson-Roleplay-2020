private ["_text","_paint","_control","_save"];

_save = [player,10] call stats_nearSave;
if (_save != "")then {
		if (call tag_active)exitWith {};
		_text = [format ["Retrive Vehicle (%1) (E)",_save],format["Save Vehicle (%1) (E)",_save]]select (vehicle player != player);
		titleRsc["Rtags", "PLAIN"];
		_control = (uiNamespace getVariable 'TAGS_HUD') displayCtrl 64438;
		_control ctrlSetText _text;
};

_paint = {
	if (player distance getPos _x < 5)exitWith {true};
	false
}forEach dtk_paint_shops;

if (_paint)exitWith {
	if (vehicle player == player)exitWith{};
	if (player != driver (vehicle player))exitWith {};
	titleRsc["Rtags", "PLAIN"];
	_control = (uiNamespace getVariable 'TAGS_HUD') displayCtrl 64438;
	_control ctrlSetText "Paint Shop (E)";
};

if (call garage_near && {(vehicle player != player)})exitWith
{
	if (driver(vehicle player) == player)then {
		titleRsc["Rtags", "PLAIN"];
		_control = (uiNamespace getVariable 'TAGS_HUD') displayCtrl 64438;
		_control ctrlSetText "Performance Shop (E)";
	};
};