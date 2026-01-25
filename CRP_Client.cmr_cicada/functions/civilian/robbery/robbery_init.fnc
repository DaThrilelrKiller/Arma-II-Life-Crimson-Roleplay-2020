if (dtk_server)exitWith {};

private ["_name","_object"];

if (isNil "robbery_actions") exitWith {};
if (typeName robbery_actions != "ARRAY") exitWith {};

{
	private ["_cfg"];
	_cfg = _x;

	_object = _cfg select 0;
	_name = _cfg select 1;

	if (!isNil "_object" && {!isNull _object}) then {
		_object addaction [format ["Rob %1",_name],"noscript.sqf", format ["[%1,'%2'] spawn robbery_rob",_object,_name], 1, false, true, "", format ["dtk_civ && {(%1 getVariable ['robbery_avalible',true])} && {(%1 getVariable ['robbery_money',5000]) >= 5000}",_object]];
	};
} forEach robbery_actions;
