private ["_test","_return","_location"];

_location = _this select 0;
_location = if (isNil "_location")then{getPos player}else{_location};

_test = (nearestLocations [_location, ["Name","NameVillage","NameCityCapital","NameMarine","NameLocal","RockArea","NameCity"], 400])select 0;
if (!isNil "_test") then {
	_test =  ([str _test," "] call string_split)select 1;
	_return = (text nearestLocation [_location,_test]);
}else{
	_return = "";
};

_return