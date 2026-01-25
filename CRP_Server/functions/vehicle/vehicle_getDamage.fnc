_vehicle = _this select 0;
_selection = _this select 1;

_index = _vehicle getVariable ["selections", []]find _selection;

_damage = if (_index >= 0) then
{
_vehicle getVariable "gethit" select _index;
}
else
{
0;
};
_damage
