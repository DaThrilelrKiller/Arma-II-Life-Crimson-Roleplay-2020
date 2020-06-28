
private ["_penalty","_car","_speed","_type","_infos","_license","_demvar","_newdemerits","_i"];

for "_i" from 0 to 1 step 0 do 
{
	
_car    = vehicle player;

if ((_car  animationPhase "ani_lights") != 0.1)then
{
	{
	_speed  = speed _car;
	if ((player == driver _car) && {_car distance _x < 40} && {_speed >= 100} && {!(_car iskindof "Air")}) then 
		{ 

	/*["ALL",[_x,"speedcam",100],"network_say3d",false,true]call network_MPExec;*/		
		titleCut [" ","white in",1];
		if(_speed >= 100  && {_speed < 110}) then {_penalty = 1};
		if(_speed >= 110 && {_speed < 130}) then {_penalty = 2};
		if(_speed >= 130 && {_speed < 150}) then {_penalty = 3};
		if(_speed >= 150 && {_speed < 170}) then {_penalty = 6};
		if(_speed >= 170 		 ) then {_penalty = 7};

		[format ["Speedcam: Your Speed: %1 Limit: 90",round _speed],'\crp_data\images\tags\speedCam']call tag_notify;
		[_car,format ['Speeding: %1',round _speed],format ["Speedcam %1",(_forEachIndex + 1)]]call cdb_addNote;
		sleep 2;
		}; 

	} forEach speedcam_array;
};

sleep 0.5;

};
