private ["_marker"];

{
	[("speedcam_" + str _ForEachIndex),getPos _x,nil,nil,"colorBlack","mil_dot",nil,format ["Speedcam %1",_ForEachIndex]]call core_createMarkerLocal;
}forEach speedcam_array;