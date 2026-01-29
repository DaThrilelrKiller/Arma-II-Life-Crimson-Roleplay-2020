private ["_random","_object","_amount"];

for "_i" from 0 to 1 step 0 do {

	{
		_random = ceil ((random 5) + 5);
		_object = _x select 0;
		_amount = _object getVariable ["robbery_money",100];

		if (_amount < maxstationmoney) then
		{
			_amount = _amount + _random;
		};
		_object setVariable ["robbery_money",_amount,true];
	}forEach robbery_actions;
	sleep 30;
};