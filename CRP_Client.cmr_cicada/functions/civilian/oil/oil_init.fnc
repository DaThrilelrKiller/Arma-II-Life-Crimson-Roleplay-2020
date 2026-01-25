
if (dtk_client)then {
	private ["_pumps","_rigs"];
	_pumps = nearestobjects [dtk_center, ["Land_Ind_Oil_Pump_EP1","Land_Ind_Oil_Tower_EP1"], (dtk_center select 0)];
	_pumps call oil_actions;
	_pumps call oil_markers;

	// Gas extraction (raw gas) from oil rig bases
	// Rigs can replicate in late on clients; retry for a bit and install actions once per rig.
	if (isNil "dtk_gasRigInstaller") then {
		dtk_gasRigInstaller = [] spawn {
			private ["_rigs","_rig","_extractId","_processId","_pos","_markerName"];
			for "_t" from 0 to 60 step 3 do {
				_rigs = nearestobjects [dtk_center, ["oilrig_base"], (dtk_center select 0)];
				{
					_rig = _x;
					if (isNull _rig) then { } else {
						if (isNil { _rig getVariable "gas_extract_action" }) then {
							_extractId = _rig addaction ["","functions\items\mine.sqf",'gas', 24, false, true, "LeanRight","player distance _target < 5 && {!([_target,'Extract Gas (E)','data\images\tags\Gas pump']call tag_show)}"];
							_rig setVariable ["gas_extract_action", _extractId, false];
						};
						if (isNil { _rig getVariable "gas_process_action" }) then {
							_processId = _rig addaction ["","scripts\itemprocess.sqf",["RawGas", "GasBarrel", 2,"DTK_License_civ_oil"], 23, false, true, "LeanRight","player distance _target < 5 && {!([_target,'Process Gas (E)','data\images\tags\Gas pump']call tag_show)}"];
							_rig setVariable ["gas_process_action", _processId, false];
						};
						if (isNil { _rig getVariable "gas_rig_marker" }) then {
							_pos = getPos _rig;
							_markerName = format ["gasrig_%1_%2_%3", round (_pos select 0), round (_pos select 1), round (_pos select 2)];
							[_markerName, _pos, nil, nil, "colorGreen", "mil_dot", nil, "Gas Rig"] call core_createMarkerLocal;
							_rig setVariable ["gas_rig_marker", _markerName, false];
						};
					};
				} forEach _rigs;

				sleep 3;
			};
		};
	};
};
