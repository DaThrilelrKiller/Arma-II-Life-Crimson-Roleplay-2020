private ["_units","_unit","_state","_threatGoneTime"];

if (!DTK_CIV_SURRENDER_ENABLED) exitWith {};

while {true} do {
	/* Get all civilian units */
	_units = [];
	{
		if (side _x == civilian && {alive _x}) then {
			if (isNil {_x getVariable "dtk_surrender_handler"}) then {
				_units set [count _units, _x];
				_x setVariable ["dtk_surrender_handler", true, true];
				_x setVariable ["dtk_surrender_state", "normal", true];
			} else {
				_units set [count _units, _x];
			};
		};
	} forEach allUnits;
	
	/* Process each civilian */
	{
		_unit = _x;
		if (!alive _unit) then {
			_unit setVariable ["dtk_surrender_handler", nil, true];
			_unit setVariable ["dtk_surrender_state", nil, true];
		} else {
			_state = _unit getVariable ["dtk_surrender_state", "normal"];
			
			switch (_state) do {
				case "normal": {
					/* Check if should surrender */
					if ([_unit] call s_civilians_checkSurrender) then {
						_unit setVariable ["dtk_surrender_state", "surrendering", true];
					};
				};
				
				case "surrendering": {
					/* Perform surrender actions */
					if (vehicle _unit != _unit) then {
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
				};
				
				case "surrendered": {
					/* Check if threat is gone */
					if (!([_unit] call s_civilians_checkSurrender)) then {
						_threatGoneTime = _unit getVariable ["dtk_threatGoneTime", 0];
						if (_threatGoneTime == 0) then {
							_unit setVariable ["dtk_threatGoneTime", time, true];
							_threatGoneTime = time;
						};
						
						/* Check if duration has passed */
						if ((time - _threatGoneTime) >= DTK_CIV_SURRENDER_DURATION) then {
							_unit setVariable ["dtk_surrender_state", "resuming", true];
						};
					} else {
						/* Threat returned, reset timer */
						_unit setVariable ["dtk_threatGoneTime", 0, true];
					};
				};
				
				case "resuming": {
					/* Resume normal behavior */
					_unit setVariable ["dtk_surrendered", false, true];
					_unit setVariable ["dtk_threatGoneTime", 0, true];
					_unit enableAI "MOVE";
					_unit enableAI "AUTOTARGET";
					_unit enableAI "TARGET";
					_unit playAction "PlayerStand";
					(group _unit) setBehaviour "CARELESS";
					(group _unit) setCombatMode "BLUE";
					
					_unit setVariable ["dtk_surrender_state", "normal", true];
				};
			};
		};
	} forEach _units;
	
	sleep DTK_CIV_SURRENDER_CHECK_INTERVAL;
};

