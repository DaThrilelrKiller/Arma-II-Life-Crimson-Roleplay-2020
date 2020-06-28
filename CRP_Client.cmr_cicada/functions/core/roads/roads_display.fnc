private ["_road","_name","_id"];

if (isOnRoad player)then 
{
	_road = call roads_near;
	if (!isNil "_road")then {
		_id = _road call roads_id;
		_name = _id call roads_name;
		
		if (_id != road_myID)then {
			roads_myRoad = _name;
			road_myID = _id;
			titletext [_name, "PLAIN DOWN"];
		};
	};
};


