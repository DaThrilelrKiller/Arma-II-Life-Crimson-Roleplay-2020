
private ["_vcl"];
_unit = _this select 0;
_vcl = (nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 6] select 0);


if (isNil '_vcl')exitWith { systemChat "No Vehicles In Range!";};


if(_unit distance _vcl < 10 && {(["actspercmstpsnonwrfldnon_interrogate02_forgoten","civillying01"] find (animationstate _unit)) > -1})exitWith{
    systemChat "You have put the player in the car";
    [_unit,[_unit,_vcl],{(_this select 0) moveInCargo (_this select 1)},false,false]call network_MPExec;
};

systemChat "No Civilians Restrained Close To Vehicle!";