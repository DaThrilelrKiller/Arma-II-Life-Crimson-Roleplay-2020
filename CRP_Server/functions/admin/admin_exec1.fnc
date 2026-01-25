private ["_text"];
_text = lbText [1500, (lbCurSel 1500)];
switch (_text) do
{
	case "Delete": 
	{
		closeDialog 0;
		_object = cursorTarget;
		if (_object in INV_ServerBuildingArray)exitWith {systemChat "that object cannot be deleted"};
		deleteVehicle _object;
		systemChat format ["%1 deleted",_object];
		[format['[Delete] %1 deleted %2',name player,_object],'#1000']call log_send;
	};
	case "Teleport": 
	{
		closeDialog 0;
		call admin_teleport;
	};
	case "Console": 
	{
		closeDialog 0;
		call admin_console;
	};
	case "Tags": 
	{
		closeDialog 0;
		if (!isNil "t_admin_tags")then {
			terminate "t_admin_tags";
			t_admin_tags = nil;
			systemchat "Tags: Disabled";
		};
		
		systemchat "Tags: Enabled";
		t_admin_tags = []spawn admin_tags;
	};
	case "Move": 
	{
		closeDialog 0;
		call admin_Move;
	};
	case "Inventory": 
	{
		closeDialog 0;
		call admin_inventory;
	};
	case "Licenses": 
	{
		closeDialog 0;
		call admin_licenses;
	};
	case "Vehicles": 
	{
		closeDialog 0;
		call admin_vehicles;
	};
	case "Logs": 
	{
		closeDialog 0;
		call admin_logs;
	};
	case "Spectate": 
	{
		_currentcam = cameraView;
		_player = (call compile lbData [2100, lbCurSel 2100]select 1);
		_player switchCamera "EXTERNAL";
		
		[format['[Spectate] %1 started Spectating %2',name player,name _player],'#1000']call log_send;
				
		[_currentcam]spawn 
		{
			waitUntil {speed player > 0.1};
			(vehicle player) switchCamera (_this select 0);
		};
		closeDialog 0;
	};
	case "Camera": 
	{
		closeDialog 0;
		player exec "camera.sqs";
	};
	case "Revive": 
	{
		call admin_Revive;
		closeDialog 0;
	};
	case "Clothing": 
	{
		closeDialog 0;
		[]call admin_clothes;
	};
	case "Sounds": 
	{
		closeDialog 0;
		[]call admin_sounds;
	};
	case "TP2ME": 
	{
		_to = (call compile lbData [2100, lbCurSel 2100]select 1);
		_to setPos getPos player;
		closeDialog 0;
	};
	case "TPME2THEM": 
	{
		_to = (call compile lbData [2100, lbCurSel 2100]select 1);

		if (vehicle _to != _to)then {
			[(vehicle _to)]call vehicle_getin
		}else{
			player setPos getPos _to;
		};
		closeDialog 0;
	};
	case "Comp 100k": 
	{
		_to = (call compile lbData [2100, lbCurSel 2100]select 1);
		[_to,player,{
		dtk_bank = dtk_bank + 100000;
		systemchat format ["Comp of 100K has been given by %1",name _this];
		},false,false]call network_MPExec;
	
		closeDialog 0;
	};
	case "Comp 1M": 
	{
		_to = (call compile lbData [2100, lbCurSel 2100]select 1);
		[_to,player,{
		dtk_bank = dtk_bank + 1000000;
		systemchat format ["Comp of 1M has been given by %1",name _this];
		},false,false]call network_MPExec;
	
		closeDialog 0;
	};
	case "Start Brush Fire": 
	{
		["SERVER",[],"s_ems_brushFire",true,false]call network_MPExec;
		systemchat "You have started a brush fire!";
		closeDialog 0;
	};
	case "Delete Brush Fires": 
	{
		{
			_x setDamage 1;
		}forEach allMissionObjects "HeliHEmpty";
		closeDialog 0;
	};
};