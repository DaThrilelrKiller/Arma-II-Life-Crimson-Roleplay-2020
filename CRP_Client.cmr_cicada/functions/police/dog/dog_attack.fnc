private ["_target","_dog","_sound"];

_target = _this select 0;
player setVariable ["CLAY_DogStatus", "Attacking"];

_sound = createSoundSource ["Sound_BadDog", getpos dtk_dog, [], 0];
_sound attachTo [dtk_dog, [0,0,0]];

while {alive dtk_dog && alive _target && player getVariable "CLAY_DogStatus" == "Attacking"} do
{
	dtk_dog doMove getPos _target;
	If (dtk_dog distance _target < 3 && vehicle _target == _target) Then
	{
		dtk_dog doTarget _target;
		dtk_dog lookAt _target;

		dtk_dog switchMove "CLAY_DogAttack";
		dtk_dog setVelocity [0, 0, 5];
		
		_target setHit ["legs", 1];
		_target setHit ["hands", 1];
		_target setDammage 0.8;
		systemchat"The dog has bitten his target";
		["ALL",[_target,"adthpercmstpslowwrfldnon_4"],"network_SwitchMove",false,true]call network_MPExec;
		player setVariable ["CLAY_DogStatus", ""];
		sleep 12;
		["ALL",[_target,"amovppnemstpsnonwnondnon"],"network_SwitchMove",false,true]call network_MPExec;
		
	};
	sleep 1;
};
deleteVehicle _sound;

