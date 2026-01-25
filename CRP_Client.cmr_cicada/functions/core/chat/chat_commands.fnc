private ["_display","_chat","_text","_stringElements","_command"];

[player,format['typed "%1" in chat',_this],[1,1,1,1]]call admin_logs_add;

_stringElements = [_this," "] call string_split;
_command = _stringElements select 0;


switch (_command) do
{
	case "!comp": 
	{
		if (SwagDevs || {adminlevel2} || {adminlevel3} || {adminlevel4}) then 
		{
		private ["_player","_amount"];
		_player = call compile (_stringElements select 1);
		_amount = parseNumber (_stringElements select 2);
		if (isNull _player)exitWith {systemChat "invalid player"};
		
		[_player,["true",format ["%1 gave you comp of %2", name player,_amount],2],"network_chat",false,false]call network_MPExec;
		[_player,[player,"geld",_amount],"storage_add",false,false]call network_MPExec;
		systemChat format ["you gave %1 %2 a comp amount of %3",_player,name _player,_amount];
		closeDialog 0;
		_display closeDisplay 1;
		};
	};
	case "!tp2me": 
	{
		if (SwagDevs) then 
		{
		private ["_player"];
		_player = call compile (_stringElements select 1);
		if (isNull _player)exitWith {systemChat "invalid player"};
		if (player == _player)exitWith {systemChat "you cannot teleport yourself silly";};
		
		[_player,["true",format ["%1 had teleported you to him", name player],2],"network_chat",false,false]call network_MPExec;
		systemChat format ["you teleported %1 %2 to you",_player,name _player,_amount];
		closeDialog 0;
		_display closeDisplay 1;
		};
	};
	case "!question": 
	{
		private ["_Quetion"];
		_Quetion = "";
		{if (_ForEachIndex != 0)then {_Quetion = _Quetion + " "+ _x;};}forEach _stringElements; 
		["ALL",["SwagDevs",format["%1 %2 has asked a question: ""%3""",player,name player,_Quetion],2],"network_chat",false,true]call network_MPExec;
		_display closeDisplay 1;
	};
	case "!distance": 
	{
		private ["_distance"];
		_distance = parseNumber (_stringElements select 1);
		setViewDistance _distance;
		_display closeDisplay 1;
		["SERVER",[player,[["Main","distance", _distance]]],"S_stats_update",false,false]call network_MPExec;
	};
	case "!detail": 
	{
		private ["_detail","_message"];
		_detail = parseNumber (_stringElements select 1);
		if (([50, 25, 12.5, 6.25, 3.125] find _detail) < 0)exitWith 
		{
		_message = format ["50 - smoothest, less lag\n 25 - default in multiplayer \n 12.5 - default in singleplayer \n 6.25 \n 3.125 - bumpiest, higher lag"];
		[true,"Invalid Detail",_message]call Main_Notification;
		};
		setTerrainGrid _detail;
		_display closeDisplay 1;
		["SERVER",[player,[["Main","detail", _detail]]],"S_stats_update",false,false]call network_MPExec;
	};
	case "!spec": 
	{
		if (SwagDevs or adminlevel2 or adminlevel3 or adminlevel4) then 
		{
		private ["_player","_currentcam"];
		_currentcam = cameraView;
		_player = call compile (_stringElements select 1);
		_player switchCamera "EXTERNAL";
		
		[_currentcam]spawn 
		{
			waitUntil {speed player > 0.1};
			(vehicle player) switchCamera (_this select 0);
		};
		
		};
	};
	case "!performance": 
	{
		[]call core_performance;
	};
	case "!timelog":
	{
		["SERVER",[player,dtk_side],"s_experience_load",false,false]call network_MPExec;
	};
	case "!uptime": 
	{
		[]call core_performance;
	};
	case "!quest": 
	{
		call quest_info;
	};
	default 
	{ 
		if (_this != "")then {
			_stringElements call chat_tweet;
		};

	};

};
(findDisplay 24) closeDisplay 1;