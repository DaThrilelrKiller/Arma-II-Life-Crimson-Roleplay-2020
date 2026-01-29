
if (dtk_client)then {
	private ["_pumps"];
	_pumps = nearestobjects [dtk_center, ["Land_Ind_Oil_Pump_EP1","Land_Ind_Oil_Tower_EP1"], (dtk_center select 0)];
	_pumps call oil_actions;
	_pumps call oil_markers;
};
