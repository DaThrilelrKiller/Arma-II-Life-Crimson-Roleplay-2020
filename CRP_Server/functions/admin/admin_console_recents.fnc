
lbClear 1501;

_coms = profileNameSpace getVariable "v_admin_recents";
_coms = _coms call array_reverse;


{
	lbAdd [1501, _x];
}forEach _coms;