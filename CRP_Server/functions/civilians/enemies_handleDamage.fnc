private["_unit","_selection","_damage","_shooter","_ammo"];
_unit	= _this select 0;
_selection	= _this select 1;
_damage		= _this select 2;
_shooter	= _this select 3;
_ammo		= _this select 4;

_unit setHit [_selection, _damage];

_unit doTarget _shooter;
_unit doFire _shooter;
_damage
