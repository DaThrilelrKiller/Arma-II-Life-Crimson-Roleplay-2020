private ["_amount","_name","_i","_xcord","_ycord","_marker1"];

{
	_amount = round (random 3) + 1;
	_name = (_x call config_displayname);
	
	for "_i" from 0 to _amount step 1 do 
	{
		_pos = call s_fishing_water;
		_size = fishing_sizes call BIS_selectRandom;
		fishing_spots_array set [count fishing_spots_array,[_x, _pos,[_size,_size]]];
	};

}ForEach fishing_array;

