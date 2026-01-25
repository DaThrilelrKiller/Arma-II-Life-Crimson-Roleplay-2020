private["_cars","_baitcar","_baitctrls"];

_cars = nearestObjects [getPos player, ["LandVehicle"], 10];
if (count _cars < 1) exitWith {systemChat  "No Cars To Bait!";};
_baitcar = _cars select 0;
if ([player,_baitcar]call keys_has) then
{
	[player,"Bait_Kit",-1] call storage_add;
	_baitctrls = [player,"Bait_Ctrl"] call storage_amount;
	if (_baitctrls < 1) then
	{
		[player,"Bait_Kit",1] call storage_add;
	};
	bc_baitcars = bc_baitcars + [_baitcar];
	systemChat  "Bait Kit Set Up!";
} else {
	systemChat  "You Do Not Own This Car! You Cannot Bait It!";
};