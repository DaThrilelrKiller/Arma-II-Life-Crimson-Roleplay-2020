_unit = _this;
_type = _unit getVariable ["type",typeOf _unit];

_config =  (missionConfigFile >> "CfgVehicles" >> _type);
_init = format['this setFace "%1";',dtk_dob select 3];
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