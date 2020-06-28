private ["_plant","_nearplants"];
_plant = _this select 0;

if !(isNil {_x getVariable "onFire"})exitWith {};

_plant setVehicleInit "i=[this,0.8,time,false,true] spawn drug_burn;"; 
_plant setVariable ["onFire", time, false];
processInitCommands;

_nearplants = nearestObjects [_plant, ["as_p_fiberPlant_EP1","as_b_PinusM1s_EP1","as_b_PistaciaL1s_EP1"], 6];
_nearplants = _nearplants - [_plant];

{
sleep (random (20)) + 5;
	if (isNil {_x getVariable "onFire"})then
	{
		[_x]spawn S_drugs_burn;
	};
	true
}count _nearplants;