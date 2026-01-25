_Arr1 = [];

for [{_i=0}, {_i < (count INV_FarmItemArray)},{_i=_i+1}] do {_Arr1 = _Arr1 + [0]}; 
sleep 10;				

private ["_u"];
for "_u" from 0 to 1 step 0 do 
{						
	for [{_i = 0}, {_i < (count INV_FarmItemArray)}, {_i = _i + 1}] do 
	{
															
		_arr    = (INV_FarmItemArray select _i);																						
		_added  = (_Arr1 select _i);																																														
		_isInArea = false;

		if(dtk_cop && {(_arr select 1) == "Unprocessed_LSD"})exitwith{};
		{
			if (((vehicle player) distance (getMarkerPos (_x select 0))) < (_x select 1)) then {_isInArea = true;};
			
		} count (_arr select 0);
							
		_hasVehicle = false;
															
		{
			if ((vehicle player) isKindOf _x) then {_hasVehicle = true;};
		} count (_arr select 4);

		if ((_isInArea) && {_hasVehicle} && {speed (vehicle player) > 2 or ((_arr select 4) select 0) == "Ship"}) then 
		{																																																				
			[(_arr select 1), (_arr select 2), (_arr select 3), (_arr select 4)] execVM "scripts\gathergen.sqf";	
		};	

	};																
sleep 1;
};
