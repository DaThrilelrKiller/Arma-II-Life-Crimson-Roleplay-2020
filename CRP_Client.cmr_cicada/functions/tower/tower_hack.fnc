private ["_units","_index","_CrackTime","_alert"];

if (DTK_Hacking)exitWith {};
DTK_Hacking = true;

[player,"Hacking Central Radio Tower",30000]call cdb_addWarrant;

_units = playableUnits;
_alert = round (random (count _units));

{
	systemchat "test";
	_CrackTime = random 0.4;
	if (_CrackTime == 0)then {
		_CrackTime = 0.1;
	};
	_index = _ForEachIndex;

	{
		if (_x call TFAR_fnc_isRadio)then {
		
			if (_index == _alert)then {
				["ALL",format["(%1 of %2)",_index,count _units],{
					titleText [format["**Someone is hacking the central Radio Tower they have cracked %1 freqs to far**!",_this], "PLAIN DOWN"];
					player  say "Bank_alarm";
						
					if (dtk_cop)then {
						systemchat "Someone is hacking the radio tower all units requested to respond!";
					};
				},false,true]call network_MPExec;
			};		
		
				
			for "_i" from 1 to 100 step 1 do {
				[format['Hacking Radio Tower Freq: (%3/%4) ... %1%2',_i,"%",_index,count _units],'',true]call tag_notify;
					
				if !(alive player)exitWith {DTK_Hacked_Freqs = [];};
				if (animationState player in ["adthpercmstpslowwrfldnon_4","adthppnemstpsraswpstdnon_2","actspercmstpsnonwrfldnon_interrogate02_forgoten"])exitWith {DTK_Hacked_Freqs = [];};		
					
				if (_i == 100)exitWith {
					DTK_Hacked_Freqs set [count DTK_Hacked_Freqs,format ["C%1 %2",_x call TFAR_fnc_getSwChannel,(_x call TFAR_fnc_getSwFrequency)]];
				};
				uiSleep _CrackTime;
			};
		};
	}forEach (weapons _x);

	if !(alive player)exitWith {DTK_Hacked_Freqs = [];};
	if (animationState player in ["adthpercmstpslowwrfldnon_4","adthppnemstpsraswpstdnon_2","actspercmstpsnonwrfldnon_interrogate02_forgoten"])exitWith {DTK_Hacked_Freqs = [];};
}forEach _units;

DTK_Hacking = false;