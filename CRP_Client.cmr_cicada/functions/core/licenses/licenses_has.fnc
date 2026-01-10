
if (isNil {_this call licenses_name})exitWith{
    true
};

_return = [false,true]select (_this in (player getvariable "cdb_license") || {_this == ""});
_return