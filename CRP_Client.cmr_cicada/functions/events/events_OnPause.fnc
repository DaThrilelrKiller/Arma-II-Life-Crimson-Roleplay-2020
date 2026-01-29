disableSerialization;
sleep 1;

private ["_a"];
for "_a" from 0 to 1 step 0 do 
{
	waitUntil {not(isnull (findDisplay 49))};
	
	_abortctrl = (findDisplay 49) displayCtrl 104;
	_Respawnctrl = (findDisplay 49) displayCtrl 1010;
	_Respawnctrl ctrlEnable false;
	_abortctrl ctrlEnable false; 
	_title = (findDisplay 49) displayCtrl 523;
	
	
	_enCtrl = [_Respawnctrl,_abortctrl] spawn 
	{
		disableSerialization;
		_Respawnctrl = _this select 0;
		_abortctrl = _this select 1;
		
		if ((lifeState player == "UNCONSCIOUS") or (!alive player) or (animationstate player == "actspercmstpsnonwrfldnon_interrogate02_forgoten"))then
		{
			if (isnull (findDisplay 49)) exitWith {};
			_abortctrl ctrlSetText "Cannot Abort While Dead Or Restrained!";
		}else
		{
			[_abortctrl]spawn 
			{
				disableSerialization;
				_abortctrl = _this select 0;
				 _abortctrl buttonSetAction "
				 ['SERVER',[player],'s_disconnect_handle',false,false]call network_MPExec;
				 ";
				private["_e"];
				for "_e" from 10 to 1 step -1 do 
				{
					if (isnull (findDisplay 49)) exitWith {};
					_text1 = format ["Please Wait: (%1)",_e]; 
					if (_e == 5) then 
					{
						[]call stats_Save;
						_text1 = format ["Saving Stats",_e]; 
					};
					_abortctrl ctrlSetText _text1;
					sleep 1;
				};
				_abortctrl ctrlSetText "Abort";
				_abortctrl ctrlEnable true; 
			};
		};
		
		_Respawnctrl ctrlSetText "Respawn Disabled";

	};
	
	_enTitle = [_title] spawn 
	{
		disableSerialization;
		_ctrl3 = _this select 0;
		_sText2 = ctrlText _ctrl3;
		_ctrl3 ctrlSetText "";
	};

	waitUntil {isNull (findDisplay 49)};
	if (!scriptDone _enCtrl) then 
	{
		terminate _enCtrl;
		terminate _enTitle;
	};
};