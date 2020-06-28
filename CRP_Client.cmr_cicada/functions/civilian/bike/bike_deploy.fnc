
if (isNull dtk_bike)then {
	dtk_bike_deploying = true;
	player playMove "AinvPknlMstpSlayWrflDnon_medic";
	sleep 3.0;
	waitUntil {animationState player != "AinvPknlMstpSlayWrflDnon_medic"};
	dtk_bike = ["Old_bike_TK_CIV_EP1",screenToWorld[0.5,0.95],player,dtk_side]call shops_createVehicle;
	dtk_bike_deploying = nil;
}else{
	if (isNull (driver dtk_bike))then {
		deleteVehicle dtk_bike;
		dtk_bike = objNull;
	}else{
		dtk_bike = objNull;
		[]spawn bike_deploy;
	};
};