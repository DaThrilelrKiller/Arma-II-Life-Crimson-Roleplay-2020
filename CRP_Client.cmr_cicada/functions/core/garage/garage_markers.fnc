private ["_marker"];

{
	[("garage_" + str _ForEachIndex),getPos _x,nil,nil,"colorBlack","mil_dot",nil,"Performance Shop"]call core_createMarkerLocal;
}ForEach DTK_Garage_Array;