private["_actions"];
_actions = _this select 0;
if (isNil "_actions") exitWith {[]};
if (typeName _actions != "ARRAY") exitWith {[]};

private["_keys"];
_keys = [];
{
private["_action"];
_action = _x;
if (true) then {
if (isNil "_action") exitWith {};
if (typeName "_action" != "STRING") exitWith {};
_keys = _keys + (actionKeys _action);
};
} foreach _blocked_actions;
_keys