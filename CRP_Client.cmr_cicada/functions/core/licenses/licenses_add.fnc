private ["_object","_lic","_licenses","_name"];


_object = _this select 0;
_lic = _this select 1;
_licenses = (_object getvariable ["cdb_license",[]]);
_name = _lic call licenses_name;

if (_lic in _licenses)then
{
systemchat format ["%1 already has %2",name _object,_name];
}
else
{
_licenses set [count _licenses,_lic];
};

_object setVariable ["cdb_license",_licenses,true];