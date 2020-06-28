private ["_income","_areas"];

_income = 0;
_areas = 0;

/*fix for gang paychecks while not in a gang*/
if ((call gang_name) == "")exitWith {};


{
	if ((call gang_name) == [_x] call zone_owner)then {
		_income = _income + 3000;
		_areas = _areas + 1;
	};
}forEach zones;

if (_areas != 0)then {
	systemchat format ["You have made %1$ for owning %2 gang zones",_income,_areas];
	dtk_bank = dtk_bank + _income;
};
