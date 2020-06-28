private ["_vehicle","_spike"];

if (typeName _this != "OBJECT")exitWith {
	_pos = ScreenToWorld [0.5,0.7];
	_pos = if (_pos distance getPos player > 10)then {getPos player}else{_pos};
	
	_spike = "Fort_RazorWire" createVehicle [0, 0, 0];
	_spike setDir (getDir player) + 90;
	_spike setPos _pos;
	_spike setDamage 1;
	["ALL",_spike,"police_spikes",true,false]call network_MPExec;
	[player,"spikestrip",-1] call storage_add;
};

while {!isNull _this} do {
	_vehicle = vehicle player;
	if (player distance _this < 5 && {vehicle player != player})exitWith {
		_vehicle setHit ["wheel_1_1_steering", 0];
		_vehicle setHit ["wheel_2_1_steering", 0];
		_vehicle setHit ["wheel_1_2_steering", 1];
		_vehicle setHit ["wheel_2_2_steering", 0];
		_vehicle setFuel ((fuel _vehicle) - 0.25);
		deleteVehicle _this;
	};
	sleep 0.01;
};