private ["_obj","_int","_attach","_time","_fire","_smoke","_light","_sound","_original","_markers","_realObj"];

_obj = _this select 0;
_int = _this select 1;
_realObj = _this select 2;

_int = if (_int == 0)then {round (random 15)}else{_int};
_int = if (_int < 4)then {4}else{_int};
_attach = false;

_time = time;

_original = _int;

_fire = "#particlesource" createVehicleLocal [0,0,0];
_fire setdropinterval 0.02;
_smoke = "#particlesource" createVehicleLocal [0,0,0];
_light = "#lightpoint" createVehicleLocal [0,0,0];
_light setLightBrightness 0.5;
_light setLightAmbient[0.8, 0.6, 0.2];
_light setLightColor[1, 0.5, 0.4];

if (_attach)then {
	_obj attachto [_realObj,[0,0,0],"destructionEffect2"];
	_fire attachto [_realObj,[0,0,0],"destructionEffect2"];
	_smoke attachto [_realObj,[0,0,0],"destructionEffect1"];
	_light lightAttachObject [_realObj, [0,0,0]];
}else{
	_fire setPos getPos _obj;
	_smoke setPos getPos _obj;
	_light setPos getPos _obj;
};

if (dtk_server) then 
{
	_markers = ["",4,"ColorOrange",getPos _obj]call ems_createMarker;
	_sound = createSoundSource ["Sound_Fire", getpos _obj, [], 0];
	if (_attach)then {
		_sound attachto [_obj,[0,0,0],"destructionEffect1"];
	}else{
		_sound setPos getPos _obj;
	};
};


while {(_int>3) && !(isNull _fire) && !(isNull _obj)} do
{
	_fire setParticleParams 
	[["\Ca\Data\ParticleEffects\Universal\Universal", 16, 10, 32],
	"", "Billboard", 1, 0.3*_int, 
	"destructionEffect2",[0, 0, 0.17*_int],
	0, 10, 7.9, 1, [0.3*_int, 0.05*_int], 
	[[1,1,1,-0], [1,1,1,-1], [1,1,1,-1], [1,1,1,-1], [1,1,1,-1], [1,1,1,0]], 
	[0.5, 1], 1, 0, "", "", _obj];

	_fire setParticleRandom [0.04*_int, [0.1*_int, 0.1*_int, 0.1*_int], [0.05*_int, 0.05*_int, 0.05*_int], 0, 0.06*_int, [0, 0, 0, 0], 0, 0];

	_cl = 0.8/_int;
	_smoke setDropInterval (0.02*_int);
	_smoke setParticleParams 
	[["\Ca\Data\ParticleEffects\Universal\Universal", 16, 7, 48], 
	"","Billboard",1, 3*_int, 
	"destructionEffect1",[0, 0, 0.5*_int],  
	0, 0.05, 0.04, 0.05, [0.5 + 0.5*_int, 3 + 3*_int],
	[[_cl, _cl, _cl, 0.2],[_cl, _cl, _cl, 1],[_cl, _cl, _cl, 1],
	[0.05+_cl, 0.05+_cl, 0.05+_cl, 0.9],[0.1+_cl, 0.1+_cl, 0.1+_cl, 0.6],[0.2+_cl, 0.2+_cl, 0.2+_cl, 0.3], [1,1,1, 0]], 
	[0.8,0.3,0.25], 1, 0, "", "", _obj];
	_smoke setParticleRandom [0.7*_int, [1 - _int/10,1 - _int/10,1 - _int/10], [0.2*_int, 0.2*_int, 0.05*_int], 0, 0.3, [0.05, 0.05, 0.05, 0], 0, 0];

	_light setLightBrightness (_int/30);

	if (damage _fire > damage _obj)then {
		_int = _original *(1 -(damage _fire)*1);
		_obj setDamage (damage _fire);
	}else{
		_int = _original *(1 -(damage _obj)*1);
	};
	
	if (player distance _obj < 5 && {((["a2l_firefighter1","a2l_firefighter"] find (typeOf player)) < 0)})then {
		_damage = damage player;
		player setDamage _damage + 0.03;
	};

	sleep 1.5;
};

while {_int>0 && !(isNull _obj)} do
{
	_cl = 0.8/_int;
	_smoke setDropInterval (0.01 + 0.02*_int);
	_smoke setParticleParams 
	[["\Ca\Data\ParticleEffects\Universal\Universal", 16, 7, 48], 
	"","Billboard",1, 3*_int, 
	"destructionEffect1",[0, 0, 0.5*_int],  
	0, 0.05, 0.04, 0.05, [0.5*_int, 3*_int],
	[[_cl, _cl, _cl, 0.2],[_cl, _cl, _cl, 1],[_cl, _cl, _cl, 1],
	[0.05+_cl, 0.05+_cl, 0.05+_cl, 0.9],[0.1+_cl, 0.1+_cl, 0.1+_cl, 0.6],[0.2+_cl, 0.2+_cl, 0.2+_cl, 0.3], [1,1,1, 0]], 
	[0.8,0.3,0.25], 1, 0, "", "", _obj];
	_smoke setParticleRandom [0.7*_int, [1 - _int/10,1 - _int/10,1 - _int/10], [0.2*_int, 0.2*_int, 0.05*_int], 0, 0.3, [0.05, 0.05, 0.05, 0], 0, 0];

	_light setLightBrightness (_int/30);

	_int=_int - 0.5;
	sleep 1.5;
};




if (dtk_server) then {
	deletevehicle _obj;
	deletevehicle _sound;
	{deleteMarker _x}forEach _markers;
	deleteMarker "mrk_ems_1";deleteMarker "mrk_ems_1_area";
};

deletevehicle _fire;
deletevehicle _smoke; 
deletevehicle _light;