private ["_plate"];


if (count _this > 1)then
{
	_plate = _this select 1;
}else
{
	_plate = 
	[
	ar_plate_letters call BIS_selectRandom,
	ar_plate_letters call BIS_selectRandom,
	ar_plate_letters call BIS_selectRandom,
	"-",
	ar_plate_numbers call BIS_selectRandom,
	ar_plate_numbers call BIS_selectRandom,
	ar_plate_numbers call BIS_selectRandom,
	ar_plate_numbers call BIS_selectRandom
	];
};

(_this select 0) setVariable ["dtk_plate",_plate,true];
_plate