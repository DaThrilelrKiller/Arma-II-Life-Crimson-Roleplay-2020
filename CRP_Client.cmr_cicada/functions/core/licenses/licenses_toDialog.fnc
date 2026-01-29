private ["_idc","_object","_licences","_name","_index"];


_idc = _this select 0;
_object = _this select 1;

_licences = _object getVariable ["cdb_license",[]];

{
	_name = _x call licenses_name;
	_index = lbAdd [_idc,_name];
	lbSetData [_idc, _index, _x];
}count _licences;