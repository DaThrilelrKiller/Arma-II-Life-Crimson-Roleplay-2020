private ["_id","_name"];
_id = _this;
_name = 
{
	_ids = _x select 1;
	if (_id in _ids)exitWith {(_x select 0)};
	_name = "";
}count roads_config;

_name