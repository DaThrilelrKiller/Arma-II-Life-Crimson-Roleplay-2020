private ["_income","_condition","_money"];

for "_i" from 0 to 1 step 0 do {
	sleep 300;
	_income = 0;

	{
	_condition = _x select 0;
	_money = _x select 1;

		if (call _condition)then
		{
			_income = _income + _money;
		};
		true
	}count ar_paychecks;

	if (!isNil "dtk_bank")then {
		dtk_bank = dtk_bank + _income;
	};
	
	[]call zone_paycheck;
	[format ["%1 you recived a paycheck of %2$",(name player),_income],'\CA\misc\data\icons\picture_money_CA']call tag_notify;
};