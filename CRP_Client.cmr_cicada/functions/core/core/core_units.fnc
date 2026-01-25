private ["_amount","_return","_i","_id","_class","_name"];
_amount = getNumber(missionConfigFile >> "MissionSQM" >> "Mission" >> "Groups" >> "items");
_return = [];

for "_i" from 0 to _amount do 
{
	_id = format["Item%1",_i];
	_class = getText(missionConfigFile >> "MissionSQM" >> "Mission" >> "Groups" >> _id >> "Vehicles" >> "Item0" >> "player");
	if (_class != "")then {
		_name = getText(missionConfigFile >> "MissionSQM" >> "Mission" >> "Groups" >> _id >> "Vehicles" >> "Item0" >> "text");
		if (_name != "")then {
		_return set [count _return,_name];
		};
	};
};
_return