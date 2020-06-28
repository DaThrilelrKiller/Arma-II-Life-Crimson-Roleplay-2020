[]spawn {
private ["_vehicle","_speed","_random"];


if (vehicle player == player) exitWith {};
if (!v_pitavailable) exitwith {player sidechat format["Your Pit Maneuver Is Not Available Right Now."];};

_vehicle = (nearestobjects [getpos player, ["LandVehicle"], 7] select 1);
_speed = speed _vehicle;
_random = floor random 2;


if (isNil "_vehicle") exitwith {v_pitavailable = true; systemchat format["You are not in range to pit a vehicle."];};
if (_speed <= 39) exitwith {systemchat format["Your Target Must Be Going At Least 40 km/h!"];};

if ((_random == 1) && {_vehicle distance player <= 7}) then {
	_vehicle setVehicleInit 'this setfuel .10'; processInitCommands;
	systemchat "You have drained 90% of their fuel!";

} else {
	systemchat format["You have failed to disable the vehicle!"];
};

systemchat format["Your Pit Maneuver Is Now Disabled. It Will Be Available In 3 Minutes."];
v_pitavailable = false;
sleep 180;
v_pitavailable = true;
systemchat format["Your Pit Maneuver Is Now Available."];

};