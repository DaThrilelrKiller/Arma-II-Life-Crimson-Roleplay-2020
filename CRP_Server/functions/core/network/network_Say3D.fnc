private ["_object","_sound","_distance"];

_object = _this select 0;
_sound = _this select 1;
_distance = _this select 2;


if (player distance  _object < _distance)then
{
	_object say3D _sound;
};
	  