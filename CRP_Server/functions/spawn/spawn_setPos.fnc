private ["_array"];
_array = call compile lbData [1401, (lbCurSel 1401)];

if (isNil '_array') exitWith 
{
	ctrlSetText [1601, 'Spawn not Valid'];
	[]spawn
	{
		sleep 3;
		ctrlSetText [1601, 'Spawn'];
	};
};

player setUnconscious false;
player allowDamage true;
['ALL',[player,' '],'network_SwitchMove',false,true]call network_MPExec;
['ALL',player,{_this allowDamage true;},false,true]call network_MPExec;
closeDialog 0;

player setPos _array; 
[]call core_reveal;

if (isNil "dtk_loaded")then {
	disableSerialization;
	65 cutRsc ["dtk_logo", "PLAIN"];
	
	
	waitUntil {camCommitted  dtk_cam};
	_ui = uiNameSpace getVariable "dtk_logo";
	_control = _ui displayCtrl 1;
	_control ctrlSetScale 0.175;
	_control ctrlSetPosition [safeZoneX+safeZoneW*0.01, safeZoneY+safeZoneH-0.18];
	"dynamicBlur" ppEffectAdjust [0]; 
	"dynamicBlur" ppEffectCommit 3;
	_control ctrlCommit 3;
	dtk_loaded = true;
};

dtk_cam cameraEffect ["terminate","back"];
168 cutText ["", "PLAIN"];
dtk_spawned = true;