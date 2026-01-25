lbClear 1401;

lbAdd [1401, "                         Spawns"];
lbAdd [1401, "======================================================="];


{
	_name = _x select 0;
	_position = _x select 1;
	_condition = call compile (_x select 2);

	if (_condition)then
	{
		_index = lbAdd [1401, _name];
		lbSetData [1401, _index, str _position];	
	};
}forEach spawnpoints;


if !(lifeState player == "UNCONSCIOUS")then {

	if (count dtk_seasion > 0)then {

		if ((dtk_seasion select 0) == s_seasion)then {
			if ((dtk_seasion select 1) - time < 120)then {
				_name = "Last logged in position";
				_index = lbAdd [1401, _name];
				lbSetData [1401, _index,str (dtk_seasion select 2)];
			};
		};
	};
};

call house_gather;