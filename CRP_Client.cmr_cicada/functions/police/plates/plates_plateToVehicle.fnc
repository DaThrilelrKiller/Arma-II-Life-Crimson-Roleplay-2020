private ["_return","_plate","_string"];
_return = objNull;

{
	_plate = _x getVariable "dtk_plate";
	if (!isNil '_plate')then 
	{
		_string = format ["%1%2%3-%5%6%7%8",(_plate select 0),(_plate select 1),(_plate select 2),(_plate select 3),(_plate select 4),(_plate select 5),(_plate select 6),(_plate select 7)];
		if (_string == _this)then {_return = _x;};
	};
	true
}count  (allMissionObjects "LandVehicle") + (allMissionObjects "Air") + (allMissionObjects "ship");

_return
