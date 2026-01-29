private ["_marker"];

if (dtk_client)then {
	
	{
		_marker = [("land_save_" + str _ForEachIndex),getPos _x,nil,nil,"ColorWhite","mil_dot",nil,"Save Point (Land)"]call core_createMarkerLocal;
		_marker setMarkerAlphaLocal 1;
		DTK_Land_Saves set [count DTK_Land_Saves,_marker];
	}ForEach allMissionObjects "Land_Ind_Garage01_EP1";
	
	{
		_marker = [("plane_save_" + str _ForEachIndex),getPos _x,nil,nil,"ColorWhite","mil_dot",nil,"Save Point (Plane)"]call core_createMarkerLocal;
		_marker setMarkerAlphaLocal 1;
		DTK_Plane_Saves set [count DTK_Plane_Saves,_marker];
	}ForEach (nearestobjects [dtk_center, ["Land_SS_hangar"], (dtk_center select 0)]); 
	
	{
		_marker = [("heli_save_" + str _ForEachIndex),getPos _x,nil,nil,"ColorWhite","mil_dot",nil,"Save Point (Helicopter)"]call core_createMarkerLocal;
		_marker setMarkerAlphaLocal 1;
		DTK_Heli_Saves set [count DTK_Heli_Saves,_marker];
	}ForEach allMissionObjects "bry_helipad";
	{
		_marker = [("boat_save_" + str _ForEachIndex),getPos _x,nil,nil,"ColorWhite","mil_dot",nil,"Save Point (Boat)"]call core_createMarkerLocal;
		_marker setMarkerAlphaLocal 1;
		DTK_Boat_Saves set [count DTK_Boat_Saves,_marker];
	}ForEach (nearestobjects [dtk_center, ["Land_Nav_Boathouse"], (dtk_center select 0)]); 
};