private ["_anims","_obj","_anims"];

_anims = _this select 1;
_obj = _this select 0;

{
waitUntil{(_obj animationPhase (_x select 0)) == (_x select 1)};
}forEach _anims;
