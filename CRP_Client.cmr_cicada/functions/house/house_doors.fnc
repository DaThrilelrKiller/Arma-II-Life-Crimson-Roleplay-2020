_building = _this select 0;
_type = if (typeName _building == "STRING")then{_building}else{typeOf _building};

_i = 1;
_doors = [];

_config = (configFile >> "CfgVehicles" >> _type >>  "AnimationSources");

for "_i" from 1 to (count _config) step 1 do 
{
	_class = _config >> format["Dvere%1",_i]; 
	if !(isClass _class)exitWith {};
	_doors set [count _doors,format["Dvere%1",_i]];
};

_doors