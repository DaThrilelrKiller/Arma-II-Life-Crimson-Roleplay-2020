_unit = _this;
_type = _unit getVariable ["type",typeOf _unit];

_config =  (missionConfigFile >> "CfgVehicles" >> _type);
private ["_face"];
_face = "";
if (!isNil "dtk_dob" && {typeName dtk_dob == "ARRAY"} && {count dtk_dob > 3} && {typeName (dtk_dob select 3) == "STRING"}) then {
	_face = dtk_dob select 3;
};
if (_face == "") then { _face = face player; };
_init = format['this setFace "%1";', _face];
_textures = [];

if (isClass _config)then {
	_textures = getArray(_config >>  "hiddenSelectionsTextures");
};

_textures = _unit getVariable ["textures",_textures];

{
	if (_x != "")then {
		_init = format ["%1 this setObjectTexture [%2,'%3'];",_init,_forEachIndex,_x];
	};
}forEach _textures;

_unit setVehicleInit _init;
processInitCommands;