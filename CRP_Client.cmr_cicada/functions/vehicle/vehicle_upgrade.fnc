private ["_vehicle","_vel","_cc","_upgrade","_dir","_pos"];

_vehicle = vehicle player;
if (_vehicle == player)exitWith {};

_vel = velocity _vehicle;
_cc = _vehicle getVariable "upgrades_cc";
_upgrade = _vehicle getVariable "tuning";
_dir = direction _vehicle;
_pos = getPosATL _vehicle select 2;


if (_pos < 2)then {
	if(isEngineOn _vehicle) then 
	{ 

		if (!isNil "_cc")then
		{
			if (speed _vehicle < _cc)then
			{
				if (!isNil "_upgrade")then {
					_vehicle setVelocity [
					(_vel select 0) * _upgrade, 
					(_vel select 1) * _upgrade, 
					(_vel select 2)
					];
				};
			}
			else{
					_vehicle setVelocity [
					(_vel select 0) - (sin _dir * 0.1), 
					(_vel select 1) - (cos _dir * 0.1), 
					(_vel select 2) 
					];
			
			};
		}
		else{
			if (!isNil "_upgrade")then {
					_vehicle setVelocity [
					(_vel select 0) * _upgrade, 
					(_vel select 1) * _upgrade, 
					(_vel select 2)
					];
			};
		};
	};
};

false;