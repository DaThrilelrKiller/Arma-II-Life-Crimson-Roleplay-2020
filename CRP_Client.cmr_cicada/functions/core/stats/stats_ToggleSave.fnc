private ["_kind","_vehicle","_VehicleKind"];
_vehicle = vehicle player;
_VehicleKind = _vehicle call vehicle_kind;
_kind = [player,10] call stats_nearSave;

if (_kind == "")exitWith {};
if (_kind in ["Plane","Heli"] && {((getPos _vehicle) select 2) > 1})exitWith {};
if (call tag_active)exitWith {};

if (driver _vehicle == player)then {
	if (_vehicle != player)then {
		if(_kind != _VehicleKind)exitWith {
			systemchat format ["You can not save %1's at this save point",_VehicleKind];
		};
		call stats_savevehicle;
	}else{
		_kind call vehicle_saveMenu;
	};
};
