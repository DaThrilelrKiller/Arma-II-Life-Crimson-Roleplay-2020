private ["_unit","_killer","_name","_nameKiller","_distance","_weapon","_image","_message"];

_unit = _this select 0;
_killer = _this select 1;

_name = _unit call killfeed_color;
_nameKiller = _killer call killfeed_color;

if ([_killer,["Air", "Ship", "LandVehicle","Tank"]]call core_isKindOf)then {
	_image = getText (configFile >> "CfgVehicles" >> typeOf _killer >> "Picture");
};


_distance = round (_unit distance _killer);
_weapon = currentWeapon _killer;
if (isNil "_image")then {
	_image = getText (configFile >> "CfgWeapons" >> _weapon >> "Picture");
};

_message = if (_image == "")then {
	format ["<t size='0.8' align='center'>%1 was killed by %2 at %3m</t><br/>",_name,_nameKiller,_distance];
}else{
	format ["<t size='0.8' align='center'>%1 was killed by %2 at %3m with a </t><img size='1.2' image='%4'/><br/>",_name,_nameKiller,_distance,_image];
};

_message