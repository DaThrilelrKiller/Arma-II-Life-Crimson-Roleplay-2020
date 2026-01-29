_vehicle = _this;
_vehicle = if (typeName _vehicle == "STRING")then {_vehicle}else{typeOf _vehicle};
_selections = getArray (configFile >> "CfgVehicles" >> _vehicle >> "hiddenselectionsTextures");
_return = if (count _selections < 1)then{false}else{true};
_return