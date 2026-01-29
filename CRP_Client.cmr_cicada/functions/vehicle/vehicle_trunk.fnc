private ["_vehicle"];

_vehicle = vehicle player;

if(dialog)exitwith{closeDialog 0;};
if(isnull _vehicle)exitwith{};

if (player != driver _vehicle)exitwith{systemChat  "You must be in the drivers seat to get to the trunk";};
if(!([player,_vehicle]call keys_has))exitwith{systemChat  "You do not have the keys to this vehicle.";};
[_vehicle]call storage_trunk;
