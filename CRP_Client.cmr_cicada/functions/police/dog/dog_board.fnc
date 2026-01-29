

_dog = player getVariable "CLAY_DogUnit";
player setVariable ["CLAY_DogStatus", "Boarding"];

_vehicle = _this select 0;

If (_vehicle iskindof "LandVehicle") then
{
	_pos = [0,-2.5,-.6];
	_dir = 270;

	while {alive _dog && _dog distance _vehicle > 10 && player getVariable "CLAY_DogStatus" == "Boarding"} do
	{
		_dog doMove getPos _vehicle;
		sleep 2;
	};
	If (alive _dog && {_dog distance _vehicle <= 10} && {player getVariable "CLAY_DogStatus" == "Boarding"}) Then
	{
		_dog attachTo [_vehicle, _pos];
		_dog setDir _dir;
		_dog switchMove "Dog_Stop";
		_dog disableAI "ANIM";
		sleep 1;
		player setVariable ["CLAY_DogStatus", "InVehicle"];
		_dog setVariable ["CLAY_DogVehicle", _vehicle];
	};
}
else
{
	Hint "Invalid Vehicle Type!";
	_dog doMove getPos _dog;
	sleep 1;
	player setVariable ["CLAY_DogStatus", "Waiting"];
};