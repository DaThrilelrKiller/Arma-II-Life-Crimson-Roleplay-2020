private ["_units","_unit","_state","_threatGoneTime"];

diag_log format ["[SURRENDER HANDLER] Script starting - DTK_CIV_SURRENDER_ENABLED = %1", DTK_CIV_SURRENDER_ENABLED];

if (!DTK_CIV_SURRENDER_ENABLED) exitWith {
	diag_log format ["[SURRENDER HANDLER] Handler disabled - DTK_CIV_SURRENDER_ENABLED = %1", DTK_CIV_SURRENDER_ENABLED];
	[civ47,["true",format ["Surrender handler disabled - DTK_CIV_SURRENDER_ENABLED = %1", DTK_CIV_SURRENDER_ENABLED],3],"network_chat",false,false] call network_MPExec;
};

diag_log "[SURRENDER HANDLER] Starting main loop";
[civ47,["true",format ["Surrender handler starting loop - DTK_CIV_SURRENDER_ENABLED = %1, CHECK_INTERVAL = %2", DTK_CIV_SURRENDER_ENABLED, DTK_CIV_SURRENDER_CHECK_INTERVAL],3],"network_chat",false,false] call network_MPExec;

while {true} do {
	/* Get all civilian units */
	_units = [];
	{
		if (side _x == civilian && {alive _x}) then {
			if (isNil {_x getVariable "dtk_surrender_handler"}) then {
				_units set [count _units, _x];
				_x setVariable ["dtk_surrender_handler", true, true];
				_x setVariable ["dtk_surrender_state", "normal", true];
				diag_log format ["[SURRENDER HANDLER] New civilian unit initialized: %1 (side: %2)", name _x, side _x];
				[civ47,["true",format ["New civilian unit initialized: %1 (side: %2)", name _x, side _x],3],"network_chat",false,false] call network_MPExec;
			} else {
				_units set [count _units, _x];
			};
		};
	} forEach allUnits;
	
	if (count _units > 0) then {
		diag_log format ["[SURRENDER HANDLER] Processing %1 civilian units", count _units];
	};
	
	/* Process each civilian */
	{
		_unit = _x;
		if (!alive _unit) then {
			_unit setVariable ["dtk_surrender_handler", nil, true];
			_unit setVariable ["dtk_surrender_state", nil, true];
			[civ47,["true",format ["Civilian unit died: %1", name _unit],3],"network_chat",false,false] call network_MPExec;
		} else {
			_state = _unit getVariable ["dtk_surrender_state", "normal"];
			
			switch (_state) do {
				case "normal": {
					/* Check if should surrender */
					if ([_unit] call s_civilians_checkSurrender) then {
						[civ47,["true",format ["Civilian %1: checkSurrender returned TRUE - transitioning to surrendering", name _unit],3],"network_chat",false,false] call network_MPExec;
						_unit setVariable ["dtk_surrender_state", "surrendering", true];
					};
				};
				
				case "surrendering": {
					/* Perform surrender actions */
					[civ47,["true",format ["Civilian %1: Performing surrender actions", name _unit],3],"network_chat",false,false] call network_MPExec;
					if (vehicle _unit != _unit) then {
						[civ47,["true",format ["Civilian %1: Ejecting from vehicle", name _unit],3],"network_chat",false,false] call network_MPExec;
						unassignVehicle _unit;
						_unit action ["Eject", vehicle _unit];
						sleep 0.5;
					};
					
					_unit setVariable ["dtk_surrendered", true, true];
					_unit playAction "Surrender";
					_unit disableAI "MOVE";
					_unit disableAI "AUTOTARGET";
					_unit disableAI "TARGET";
					(group _unit) setBehaviour "CARELESS";
					(group _unit) setCombatMode "BLUE";
					
					_unit setVariable ["dtk_surrender_state", "surrendered", true];
					[civ47,["true",format ["Civilian %1: Surrendered successfully - state set to surrendered", name _unit],3],"network_chat",false,false] call network_MPExec;
				};
				
				case "surrendered": {
					/* Check if threat is gone */
					if (!([_unit] call s_civilians_checkSurrender)) then {
						_threatGoneTime = _unit getVariable ["dtk_threatGoneTime", 0];
						if (_threatGoneTime == 0) then {
							_unit setVariable ["dtk_threatGoneTime", time, true];
							_threatGoneTime = time;
							[civ47,["true",format ["Civilian %1: Threat gone - timer started at %2", name _unit, _threatGoneTime],3],"network_chat",false,false] call network_MPExec;
						};
						
						/* Check if duration has passed */
						if ((time - _threatGoneTime) >= DTK_CIV_SURRENDER_DURATION) then {
							[civ47,["true",format ["Civilian %1: Duration passed (%2 >= %3) - transitioning to resuming", name _unit, (time - _threatGoneTime), DTK_CIV_SURRENDER_DURATION],3],"network_chat",false,false] call network_MPExec;
							_unit setVariable ["dtk_surrender_state", "resuming", true];
						} else {
							[civ47,["true",format ["Civilian %1: Still waiting - elapsed: %2/%3 seconds", name _unit, (time - _threatGoneTime), DTK_CIV_SURRENDER_DURATION],3],"network_chat",false,false] call network_MPExec;
						};
					} else {
						/* Threat returned, reset timer */
						_threatGoneTime = _unit getVariable ["dtk_threatGoneTime", 0];
						if (_threatGoneTime != 0) then {
							[civ47,["true",format ["Civilian %1: Threat returned - resetting timer", name _unit],3],"network_chat",false,false] call network_MPExec;
							_unit setVariable ["dtk_threatGoneTime", 0, true];
						};
					};
				};
				
				case "resuming": {
					/* Resume normal behavior */
					[civ47,["true",format ["Civilian %1: Resuming normal behavior", name _unit],3],"network_chat",false,false] call network_MPExec;
					_unit setVariable ["dtk_surrendered", false, true];
					_unit setVariable ["dtk_threatGoneTime", 0, true];
					_unit enableAI "MOVE";
					_unit enableAI "AUTOTARGET";
					_unit enableAI "TARGET";
					_unit playAction "PlayerStand";
					(group _unit) setBehaviour "CARELESS";
					(group _unit) setCombatMode "BLUE";
					
					_unit setVariable ["dtk_surrender_state", "normal", true];
					[civ47,["true",format ["Civilian %1: Resumed - state set to normal", name _unit],3],"network_chat",false,false] call network_MPExec;
				};
			};
		};
	} forEach _units;
	
	sleep DTK_CIV_SURRENDER_CHECK_INTERVAL;
};

