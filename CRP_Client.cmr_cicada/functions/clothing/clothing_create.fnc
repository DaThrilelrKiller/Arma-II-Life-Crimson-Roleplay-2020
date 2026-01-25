private ["_type","_config","_init","_textures","_name","_group","_unit"];

_type = _this select 0;
_type = _type call config_class;
_type = if (_type == "")then {_this select 0}else{_type};

_config =  (missionConfigFile >> "CfgVehicles" >> _type);
_init = "";
_textures = [];
_name = vehicleVarName player;

if (isClass _config)then {
	_type = inheritsFrom _config; 
	_type = conFigName _type;
	_textures = getArray(_config >>  "hiddenSelectionsTextures");
};

_group = (group player);
_unit = _group createUnit [_type, (position player), [], 0, "NONE"];
_unit setDir (getDir player);
player setVehicleVarName format["old_%1", _name];
private ["_face"];
_face = "";
if (!isNil "dtk_dob" && {typeName dtk_dob == "ARRAY"} && {count dtk_dob > 3} && {typeName (dtk_dob select 3) == "STRING"}) then {
	_face = dtk_dob select 3;
};
if (_face == "") then { _face = face player; };
_init = format['this setVehicleVarName "%1"; %1 = this; this setFace "%2";', _name, _face];
_unit setVariable ["type",_this select 0,true];

{
	_init = format ["%1 this setObjectTexture [%2,'%3'];",_init,_forEachIndex,_x];
}forEach _textures;

_unit setVehicleInit _init;
processInitCommands;

_unit