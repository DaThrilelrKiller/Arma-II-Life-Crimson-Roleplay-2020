private ["_kinds","_kind"];

lbadd [2101,"All"];

_kinds = [];
{
	_kind = _x call config_type;
	if !(_kind in _kinds)then {
		_kinds set [count _kinds,_kind];
		lbadd [2101,_kind];
	};
}forEach shop_selllist;

lbSetCurSel [2101,0];

