
_v = _this select 0;
_int = _this select 1;
_t = _this select 2;
_tdiff = time - _t;
_lifecheck=true; 
_fade=true; 
private ["_snd"];
if (count _this > 3) then {_lifecheck=_this select 3};
if (count _this > 4) then {_fade=_this select 4};
if (_fade) then {_int = _int - (_tdiff*0.02/3)};

_fl = "#particlesource" createVehicleLocal getpos _v;
_fl attachto [_v,[0,0,0],"destructionEffect2"];
_fl setdropinterval 0.02;

_sm = "#particlesource" createVehicleLocal getpos _v;
_sm attachto [_v,[0,0,0],"destructionEffect1"];

_li = "#lightpoint" createVehicleLocal getpos _v;
_li setLightBrightness 0;
_li setLightAmbient[0.8, 0.6, 0.2];
_li setLightColor[1, 0.5, 0.4];
_li lightAttachObject [_v, [0,0,0]];

if (isserver) then 
{
	_snd = createSoundSource ["Sound_Fire", getpos _v, [], 0];
	_snd attachto [_v,[0,0,0],"destructionEffect1"];
};


while {(_int>3) && !(alive _v && _lifecheck) && (getpos _v select 2 > -2.5) && !(isnull _v)} do
{
_fl setParticleParams 
[["\Ca\Data\ParticleEffects\Universal\Universal", 16, 10, 32],
"", "Billboard", 1, 0.3*_int, 
"destructionEffect2",[0, 0, 0.17*_int],
0, 10, 7.9, 1, [0.3*_int, 0.05*_int], 
[[1,1,1,-0], [1,1,1,-1], [1,1,1,-1], [1,1,1,-1], [1,1,1,-1], [1,1,1,0]], 
[0.5, 1], 1, 0, "", "", _v];
_fl setParticleRandom [0.04*_int, [0.1*_int, 0.1*_int, 0.1*_int], [0.05*_int, 0.05*_int, 0.05*_int], 0, 0.06*_int, [0, 0, 0, 0], 0, 0];

_cl = 0.8/_int;
_sm setDropInterval (0.02*_int);
_sm setParticleParams 
[["\Ca\Data\ParticleEffects\Universal\Universal", 16, 7, 48], 
"","Billboard",1, 3*_int, 
"destructionEffect1",[0, 0, 0.5*_int],  
0, 0.05, 0.04, 0.05, [0.5 + 0.5*_int, 3 + 3*_int],
[[_cl, _cl, _cl, 0.2],[_cl, _cl, _cl, 1],[_cl, _cl, _cl, 1],
[0.05+_cl, 0.05+_cl, 0.05+_cl, 0.9],[0.1+_cl, 0.1+_cl, 0.1+_cl, 0.6],[0.2+_cl, 0.2+_cl, 0.2+_cl, 0.3], [1,1,1, 0]], 
[0.8,0.3,0.25], 1, 0, "", "", _v];
_sm setParticleRandom [0.7*_int, [1 - _int/10,1 - _int/10,1 - _int/10], [0.2*_int, 0.2*_int, 0.05*_int], 0, 0.3, [0.05, 0.05, 0.05, 0], 0, 0];

_li setLightBrightness (_int/30);


if (_fade) then {_int=_int - 0.02 - rain/10;};
sleep 3;
};

deletevehicle _fl;

while {(_int>0.7) && !(alive _v && _lifecheck) && (getpos _v select 2 > -2.5) && !(isnull _v)} do
{
_cl = 0.8/_int;
_sm setDropInterval (0.01 + 0.02*_int);
_sm setParticleParams 
[["\Ca\Data\ParticleEffects\Universal\Universal", 16, 7, 48], 
"","Billboard",1, 3*_int, 
"destructionEffect1",[0, 0, 0.5*_int],  
0, 0.05, 0.04, 0.05, [0.5*_int, 3*_int],
[[_cl, _cl, _cl, 0.2],[_cl, _cl, _cl, 1],[_cl, _cl, _cl, 1],
[0.05+_cl, 0.05+_cl, 0.05+_cl, 0.9],[0.1+_cl, 0.1+_cl, 0.1+_cl, 0.6],[0.2+_cl, 0.2+_cl, 0.2+_cl, 0.3], [1,1,1, 0]], 
[0.8,0.3,0.25], 1, 0, "", "", _v];
_sm setParticleRandom [0.7*_int, [1 - _int/10,1 - _int/10,1 - _int/10], [0.2*_int, 0.2*_int, 0.05*_int], 0, 0.3, [0.05, 0.05, 0.05, 0], 0, 0];

_li setLightBrightness (_int/30);

if (_fade) then {_int=_int - 0.02 - rain/10;};
sleep 3;
};

deletevehicle _sm; 
deletevehicle _li; 
if (isserver) then {deletevehicle _snd; deletevehicle _v;};
clearVehicleInit _v;