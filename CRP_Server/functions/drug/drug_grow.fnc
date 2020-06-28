private ["_i","_Zpos","_nubofPlants","_sleep","_config","_state"];
for "_i" from 0 to 1 step 0 do 
{
	_plants = ((allMissionObjects "as_p_fiberPlant_EP1") + (allMissionObjects "as_b_PinusM1s_EP1") + (allMissionObjects "as_b_PistaciaL1s_EP1"));

	_nubofPlants = count _plants;
	_nubofPlants = if (_nubofPlants < 1)then {1}else {_nubofPlants};
	_sleep = (45/_nubofPlants);
	
	{
		_state = _x getVariable ["data",0];
		_pos = getPos _x;
		_Zpos = _pos select 2;
		if (_state < 10) then 
		{
			_x setVariable ["data",(_state + 1)];
			_x setPos [_pos select 0, _pos select 1, _Zpos + 0.1];
		}else {
			if (_state == 10)then {
				_x setVariable ["data",(_state + 1)];
				private ["_config","_image","_name"];
				_config = _x call s_drug_config;
				_item = _config select 1;
				_image = format ["\crp_data\images\items\%1",[_item]call config_image];
				_name = _item call config_displayName;
			
				["ALL",[_x,['','noscript.sqf',format['%1 call drug_harvest',[_x,_config]],-1,false,true,'LeanRight',format ['player distance _target < 5 && {!([_target,"Harvest %1 (E)","%2"]call tag_show)}',_name,_image]]],"network_addAction",false,true]call network_MPExec;
			};
		};
		
		
		sleep _sleep;
		true
	}count  _plants;
	sleep 5;
};