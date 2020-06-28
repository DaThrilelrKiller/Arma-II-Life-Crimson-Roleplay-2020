
diag_log formatText["EMS Online: %1",playersNumber resistance];

if (playersNumber resistance > 1)exitWIth {};
diag_log text "Deleting Missions";

{deleteVehicle _x}forEach allMissionObjects "cl_oxygen";
{deleteVehicle _x}forEach allMissionObjects "cl_chemical_spill";
{deleteVehicle _x}forEach allMissionObjects "LADAWreck";
{_x setDamage 1;}forEach allMissionObjects "HeliHEmpty";

for "_i" from 0 to 100 step 1 do 
{
	deleteMarker format["mrk_ems_%1_area",_i];
	deleteMarker format["mrk_ems_%1",_i];
};
