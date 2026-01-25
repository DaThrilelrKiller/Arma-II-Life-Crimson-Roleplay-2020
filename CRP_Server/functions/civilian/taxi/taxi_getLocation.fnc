private ["_location","_pos2"];
_location = getPos (dtk_raods call bis_selectRandom);

if (player distance _location < taxi_minDistance)exitWith {[]call taxi_getLocation};
if (player distance _location > taxi_maxDistance)exitWith {[]call taxi_getLocation};
if (_location call taxi_allowedPos)exitWith {[]call taxi_getLocation};


_location = [(_location select 0) + 8,_location select 1,_location select 2];
_pos2 = [_location select 0,(_location select 1) + 8,_location select 2];
_location = if (isOnRoad _location)then{_pos2}else{_location};

if (isOnRoad _location)exitWith {[]call taxi_getLocation}; 

_location