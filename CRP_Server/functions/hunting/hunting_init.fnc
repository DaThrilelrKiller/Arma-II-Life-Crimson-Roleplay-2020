private ["_amount","_name","_i","_pos","_size"];

{
	_amount = round (random 3) + 1;
	_name = (_x call config_displayname);
	
	for "_i" from 0 to _amount step 1 do 
	{
		_pos = call s_hunting_hill;
		_size = hunting_sizes call BIS_selectRandom;
		hunting_spots_array set [count hunting_spots_array,[_x, _pos,[_size,_size]]];
	};

}ForEach hunting_array;

[120,s_hunting_loop]call core_AddLoop;