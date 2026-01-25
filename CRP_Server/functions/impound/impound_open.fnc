createDialog "impound";

private ["_owner","_side","_uid","_name","_displayname","_index"];


{
	_owner = _x select 10;
	_side = _x select 11;
	_uid = getPlayerUID player;

	if (_uid == _owner && {_side == dtk_side})then {
		_name = _x select 0;
		_displayname = _name call config_displayname;
		_index = lbAdd [1, _displayname];											
		lbSetData [1, _index,str _ForEachIndex];	
	};
}forEach v_impound;