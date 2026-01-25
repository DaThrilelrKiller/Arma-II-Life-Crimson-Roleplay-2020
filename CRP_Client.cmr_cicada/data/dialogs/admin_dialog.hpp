class admin_clothes
{
	idd = 555;
	
	class ControlsBackground
	{
		
	};
	class Controls
	{
		class dummybutton : RscDummy 
		{
			idc = 7;
			
		};
		class RscBackground_2200 : RscBackground 
		{
			idc = 2200;
			x = 0.180053*safezoneW+safezoneX;
			y = 0.210987*safezoneH+safezoneY;
			w = 0.167972*safezoneW;
			h = 0.561026*safezoneH;
			
		};
		class RscBackground_2201 : Rsc_lable 
		{
			idc = 2201;
			x = 0.180053*safezoneW+safezoneX;
			y = 0.176985*safezoneH+safezoneY;
			w = 0.167972*safezoneW;
			h = 0.0340016*safezoneH;
			
		};
		class RscBackground_2202 : RscBackground 
		{
			idc = 2202;
			x = 0.356024*safezoneW+safezoneX;
			y = 0.210987*safezoneH+safezoneY;
			w = 0.463923*safezoneW;
			h = 0.561026*safezoneH;
			
		};
		class RscBackground_2203 : Rsc_lable 
		{
			idc = 2203;
			x = 0.356024*safezoneW+safezoneX;
			y = 0.176985*safezoneH+safezoneY;
			w = 0.463923*safezoneW;
			h = 0.0340016*safezoneH;
			
		};
		class RscCombo_2100 : RscCombo 
		{
			idc = 2100;
			x = 0.188052*safezoneW+safezoneX;
			y = 0.227987*safezoneH+safezoneY;
			w = 0.143976*safezoneW;
			h = 0.0340016*safezoneH;
			colorDisabled[] = {0.2,0.2,0.2,1};
			onLBSelChanged = "_this call admin_inventory_handler;";
			
		};
		class RscListbox_1500 : RscListBox 
		{
			idc = 1500;
			x = 0.188052*safezoneW+safezoneX;
			y = 0.27899*safezoneH+safezoneY;
			w = 0.143976*safezoneW;
			h = 0.476022*safezoneH;
			colorSelectBackground[] = {0.5,0,0,0.5};
			onLBSelChanged = "_this call admin_exec1;";
			
		};
		class RscListbox_1501 : RscListBox 
		{
			idc = 1501;
			x = safeZoneX + safeZoneW * 0.596875;
			y = safeZoneY + safeZoneH * 0.22777778;
			w = safeZoneW * 0.20875;
			h = safeZoneH * 0.45333334;
			colorSelectBackground[] = {0.5,0,0,0.5};
		};
		class RscButton_1601 : RscButton 
		{
			idc = 1601;
			x = safeZoneX + safeZoneW * 0.371875;
			y = safeZoneY + safeZoneH * 0.70111112;
			w = safeZoneW * 0.183125;
			h = safeZoneH * 0.05111112;
			text = "Change Clothes";
			action = "[(lbData [1501, (lbCurSel 1501)])]call clothing_switch;";
			
		};
		class RscListbox_1501_copy1 : RscListBox 
		{
			idc = 1501;
			x = safeZoneX + safeZoneW * 0.371875;
			y = safeZoneY + safeZoneH * 0.22777778;
			w = safeZoneW * 0.18375;
			h = safeZoneH * 0.45333334;
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorSelectBackground[] = {0.5,0,0,0.5};
		};
		class RscButton_1601_copy1 : RscButton 
		{
			idc = 1601;
			x = safeZoneX + safeZoneW * 0.596875;
			y = safeZoneY + safeZoneH * 0.70111112;
			w = safeZoneW * 0.19875;
			h = safeZoneH * 0.05111112;
			text = "Change Clothes";
			action = "";
			
		};
		
	};
	
};


class admin_teleport
{
	idd = 111;
	movingEnable = true;
	objects[] = {};
	class controls
	{	
		class dummybutton : RscDummy {idc = 1;};
		class RscBackground_2200: RscBackground
		{
			idc = 2200;
			x = 0.180053 * safezoneW + safezoneX;
			y = 0.210987 * safezoneH + safezoneY;
			w = 0.167972 * safezoneW;
			h = 0.561026 * safezoneH;
		};
		class RscBackground_2201: Rsc_lable
		{
			idc = 2201;
			
			x = 0.180053 * safezoneW + safezoneX;
			y = 0.176985 * safezoneH + safezoneY;
			w = 0.167972 * safezoneW;
			h = 0.0340016 * safezoneH;
		};
		
		class dtk_map01 : dtkMap 
		{ 
			idc = 10023; 
			type = CT_MAP_MAIN; 
			style = ST_PICTURE; 
			x = 0.356024 * safezoneW + safezoneX;
			y = 0.210987 * safezoneH + safezoneY;
			w = 0.463923 * safezoneW;
			h = 0.561026 * safezoneH;
			onMapSingleClick =  "(vehicle player) setpos [_pos select 0, _pos select 1, 0];"; 
		};	
		
		class RscBackground_2203: Rsc_lable
		{
			idc = 2203;
			x = 0.356024 * safezoneW + safezoneX;
			y = 0.176985 * safezoneH + safezoneY;
			w = 0.463923 * safezoneW;
			h = 0.0340016 * safezoneH;
		};
		class RscCombo_2100: RscCombo
		{
			idc = 2100;
			x = 0.188052 * safezoneW + safezoneX;
			y = 0.227987 * safezoneH + safezoneY;
			w = 0.143976 * safezoneW;
			h = 0.0340016 * safezoneH;
		};
		class RscListbox_1500: RscListBox
		{
			colorSelectBackground[] = {0.5,0,0,0.5};
			idc = 1500;
			x = 0.188052 * safezoneW + safezoneX;
			y = 0.27899 * safezoneH + safezoneY;
			w = 0.143976 * safezoneW;
			h = 0.476022 * safezoneH;
			onLBSelChanged = "_this call admin_exec1;";
		};
	};
};


class admin_console
{
	idd = 111;
	movingEnable = true;
	objects[] = {};
	class controls
	{	
		class dummybutton : RscDummy {idc = 2;};
		class RscBackground_2200: RscBackground
		{
			idc = 2200;
			x = 0.180053 * safezoneW + safezoneX;
			y = 0.210987 * safezoneH + safezoneY;
			w = 0.167972 * safezoneW;
			h = 0.561026 * safezoneH;
		};
		class RscBackground_2201: Rsc_lable
		{
			idc = 2201;
			
			x = 0.180053 * safezoneW + safezoneX;
			y = 0.176985 * safezoneH + safezoneY;
			w = 0.167972 * safezoneW;
			h = 0.0340016 * safezoneH;
		};
		class RscBackground_2202: RscBackground
		{
			idc = 2202;
			x = 0.356024 * safezoneW + safezoneX;
			y = 0.210987 * safezoneH + safezoneY;
			w = 0.463923 * safezoneW;
			h = 0.561026 * safezoneH;
		};
		class RscBackground_2203: Rsc_lable
		{
			idc = 2203;
			x = 0.356024 * safezoneW + safezoneX;
			y = 0.176985 * safezoneH + safezoneY;
			w = 0.463923 * safezoneW;
			h = 0.0340016 * safezoneH;
		};
		class RscCombo_2100: RscCombo
		{
			idc = 2100;
			x = 0.188052 * safezoneW + safezoneX;
			y = 0.227987 * safezoneH + safezoneY;
			w = 0.143976 * safezoneW;
			h = 0.0340016 * safezoneH;
		};
		class RscListbox_1500: RscListBox
		{
			idc = 1500;
			x = 0.188052 * safezoneW + safezoneX;
			y = 0.27899 * safezoneH + safezoneY;
			w = 0.143976 * safezoneW;
			h = 0.476022 * safezoneH;
			colorSelectBackground[] = {0.5,0,0,0.5};
			onLBSelChanged = "_this call admin_exec1;";
		};
		class RscEdit_1400: RscEdit
		{
			idc = 1400;
			x = 0.373461 * safezoneW + safezoneX;
			y = 0.227987 * safezoneH + safezoneY;
			w = 0.42393 * safezoneW;
			h = 0.238011 * safezoneH;
			style = ST_LEFT+ST_MULTI;
			htmlControl = true;
			autocomplete = "scripting";
		};
		class RscListbox_1501: RscListBox
		{
			idc = 1501;
			onLBSelChanged = "_this call admin_console_handler;";
			x = 0.372021 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.439927 * safezoneW;
			h = 0.204009 * safezoneH;
			colorSelectBackground[] = {0.5,0,0,0.5};
		};
		class RscButton_1600: RscButton
		{
			idc = 1600;
			text = "Server"; 
			action = "['SERVER']call admin_console_exec";			
			x = 0.372021 * safezoneW + safezoneX;
			y = 0.72101 * safezoneH + safezoneY;
			w = 0.135977 * safezoneW;
			h = 0.0340016 * safezoneH;
		};
		class RscButton_1601: RscButton
		{
			idc = 1601;
			text = "All"; 
			action = "['ALL']call admin_console_exec";			
			x = 0.515997 * safezoneW + safezoneX;
			y = 0.72101 * safezoneH + safezoneY;
			w = 0.143976 * safezoneW;
			h = 0.0340016 * safezoneH;
		};
		class RscButton_1602: RscButton
		{
			idc = 1602;
			text = "Client"; 
			action = "[(call compile lbData [2100, lbCurSel 2100]select 1)]call admin_console_exec";
			x = 0.667972 * safezoneW + safezoneX;
			y = 0.72101 * safezoneH + safezoneY;
			w = 0.143976 * safezoneW;
			h = 0.0340016 * safezoneH;
		};
	};
};

class admin_logs
{
	idd = 111;
	movingEnable = true;
	objects[] = {};
	class controls
	{	
		class dummybutton : RscDummy {idc = 3;};
		class RscBackground_2200: RscBackground
		{
			idc = 2200;
			x = 0.180053 * safezoneW + safezoneX;
			y = 0.210987 * safezoneH + safezoneY;
			w = 0.167972 * safezoneW;
			h = 0.561026 * safezoneH;
		};
		class RscBackground_2201: Rsc_lable
		{
			idc = 2201;
			
			x = 0.180053 * safezoneW + safezoneX;
			y = 0.176985 * safezoneH + safezoneY;
			w = 0.167972 * safezoneW;
			h = 0.0340016 * safezoneH;
		};
		class RscBackground_2202: RscBackground
		{
			idc = 2202;
			x = 0.356024 * safezoneW + safezoneX;
			y = 0.210987 * safezoneH + safezoneY;
			w = 0.463923 * safezoneW;
			h = 0.561026 * safezoneH;
		};
		class RscBackground_2203: Rsc_lable
		{
			idc = 2203;
			x = 0.356024 * safezoneW + safezoneX;
			y = 0.176985 * safezoneH + safezoneY;
			w = 0.463923 * safezoneW;
			h = 0.0340016 * safezoneH;
		};
		class RscCombo_2100: RscCombo
		{
			idc = 2100;
			x = 0.188052 * safezoneW + safezoneX;
			y = 0.227987 * safezoneH + safezoneY;
			w = 0.143976 * safezoneW;
			h = 0.0340016 * safezoneH;
		};
		class RscListbox_1500: RscListBox
		{
			idc = 1500;
			x = 0.188052 * safezoneW + safezoneX;
			y = 0.27899 * safezoneH + safezoneY;
			w = 0.143976 * safezoneW;
			h = 0.476022 * safezoneH;
		};
		class RscListbox_1501: RscListBox
		{
			idcLeft = 1501; 
			x = 0.372021 * safezoneW + safezoneX;
			y = 0.227987 * safezoneH + safezoneY;
			w = 0.439927 * safezoneW;
			h = 0.476022 * safezoneH;
			colorSelectBackground[] = {0.5,0,0,0.5};
		};
		class RscButton_1602: RscButton
		{
			idc = 1602;
			text = "View Details"; 
			x = 0.603982 * safezoneW + safezoneX;
			y = 0.72101 * safezoneH + safezoneY;
			w = 0.207966 * safezoneW;
			h = 0.0340016 * safezoneH;
		};
	};
};

class admin_licenses
{
	idd = 111;
	movingEnable = true;
	objects[] = {};
	onLoad = "uiNamespace setVariable ['admin_licenses', _this select 0]";

	
	class controls
	{	
		class dummybutton : RscDummy {idc = 4;};
		class RscBackground_2200: RscBackground
		{
			idc = 2200;
			x = 0.180053 * safezoneW + safezoneX;
			y = 0.210987 * safezoneH + safezoneY;
			w = 0.167972 * safezoneW;
			h = 0.561026 * safezoneH;
		};
		class RscBackground_2201: Rsc_lable
		{
			idc = 2201;
			
			x = 0.180053 * safezoneW + safezoneX;
			y = 0.176985 * safezoneH + safezoneY;
			w = 0.167972 * safezoneW;
			h = 0.0340016 * safezoneH;
		};
		class RscBackground_2202: RscBackground
		{
			idc = 2202;
			x = 0.356024 * safezoneW + safezoneX;
			y = 0.210987 * safezoneH + safezoneY;
			w = 0.463923 * safezoneW;
			h = 0.561026 * safezoneH;
		};
		class RscBackground_2203: Rsc_lable
		{
			idc = 2203;
			x = 0.356024 * safezoneW + safezoneX;
			y = 0.176985 * safezoneH + safezoneY;
			w = 0.463923 * safezoneW;
			h = 0.0340016 * safezoneH;
		};
		class RscCombo_2100: RscCombo
		{
			idc = 2100;
			x = 0.188052 * safezoneW + safezoneX;
			y = 0.227987 * safezoneH + safezoneY;
			w = 0.143976 * safezoneW;
			h = 0.0340016 * safezoneH;
		};
		class RscListbox_1500: RscListBox
		{
			idc = 1500;
			x = 0.188052 * safezoneW + safezoneX;
			y = 0.27899 * safezoneH + safezoneY;
			w = 0.143976 * safezoneW;
			h = 0.476022 * safezoneH;
			colorSelectBackground[] = {0.5,0,0,0.5};
			onLBSelChanged = "_this call admin_exec1;";
		};
		class RscListbox_1501: RscListBox
		{
			idc = 1501;
			x = 0.372021 * safezoneW + safezoneX;
			y = 0.227987 * safezoneH + safezoneY;
			w = 0.18397 * safezoneW;
			h = 0.527024 * safezoneH;
			colorSelectBackground[] = {0.5,0,0,0.5};
		};
		class RscListbox_1502: RscListBox
		{
			idc = 1502;
			x = 0.611982 * safezoneW + safezoneX;
			y = 0.227987 * safezoneH + safezoneY;
			w = 0.191968 * safezoneW;
			h = 0.527024 * safezoneH;
			colorSelectBackground[] = {0.5,0,0,0.5};
			onLBSelChanged = "_this call admin_licenses_handler;";
		};
		class RscButton_1600: RscButton
		{
			idc = 1600;
			text = ">";
			action = "[]call admin_licenses_add";
			x = 0.571988 * safezoneW + safezoneX;
			y = 0.363994 * safezoneH + safezoneY;
			w = 0.023996 * safezoneW;
			h = 0.0510023 * safezoneH;
		};
		class RscButton_1601: RscButton
		{
			idc = 1601;
			text = "<"; 
			action = "[]call admin_licenses_remove";
			x = 0.571988 * safezoneW + safezoneX;
			y = 0.431997 * safezoneH + safezoneY;
			w = 0.023996 * safezoneW;
			h = 0.0510023 * safezoneH;
		};
	};
};


class admin_inventory
{
	idd = 111;
	movingEnable = true;
	objects[] = {};
	onLoad = "uiNamespace setVariable ['admin_inventory', _this select 0]";

	
	class controls
	{	
		class dummybutton : RscDummy {idc = 5;};
		class RscBackground_2200: RscBackground
		{
			idc = 2200;
			x = 0.180053 * safezoneW + safezoneX;
			y = 0.210987 * safezoneH + safezoneY;
			w = 0.167972 * safezoneW;
			h = 0.561026 * safezoneH;
		};
		class RscBackground_2201: Rsc_lable
		{
			idc = 2201;
			
			x = 0.180053 * safezoneW + safezoneX;
			y = 0.176985 * safezoneH + safezoneY;
			w = 0.167972 * safezoneW;
			h = 0.0340016 * safezoneH;
		};
		class RscBackground_2202: RscBackground
		{
			idc = 2202;
			x = 0.356024 * safezoneW + safezoneX;
			y = 0.210987 * safezoneH + safezoneY;
			w = 0.463923 * safezoneW;
			h = 0.561026 * safezoneH;
		};
		class RscBackground_2203: Rsc_lable
		{
			idc = 2203;
			x = 0.356024 * safezoneW + safezoneX;
			y = 0.176985 * safezoneH + safezoneY;
			w = 0.463923 * safezoneW;
			h = 0.0340016 * safezoneH;
		};
		class RscCombo_2100: RscCombo
		{
			idc = 2100;
			x = 0.188052 * safezoneW + safezoneX;
			y = 0.227987 * safezoneH + safezoneY;
			w = 0.143976 * safezoneW;
			h = 0.0340016 * safezoneH;
			onLBSelChanged = "_this call admin_inventory_handler;";
		};
		class RscListbox_1500: RscListBox
		{
			idc = 1500;
			x = 0.188052 * safezoneW + safezoneX;
			y = 0.27899 * safezoneH + safezoneY;
			w = 0.143976 * safezoneW;
			h = 0.476022 * safezoneH;
			colorSelectBackground[] = {0.5,0,0,0.5};
			onLBSelChanged = "_this call admin_exec1;";
		};
		class RscListbox_1501: RscListBox
		{
			idc = 1501;
			x = 0.372021 * safezoneW + safezoneX;
			y = 0.227987 * safezoneH + safezoneY;
			w = 0.18397 * safezoneW;
			h = 0.527024 * safezoneH;
			colorSelectBackground[] = {0.5,0,0,0.5};
		};
		class RscListbox_1502: RscListBox
		{
			idc = 1502;
			x = 0.611982 * safezoneW + safezoneX;
			y = 0.227987 * safezoneH + safezoneY;
			w = 0.191968 * safezoneW;
			h = 0.527024 * safezoneH;
			colorSelectBackground[] = {0.5,0,0,0.5};
		};
		class RscButton_1600: RscButton
		{
			idc = 1600;
			text = ">";
			action = "[]call admin_inventory_add";
			x = 0.571988 * safezoneW + safezoneX;
			y = 0.363994 * safezoneH + safezoneY;
			w = 0.023996 * safezoneW;
			h = 0.0510023 * safezoneH;
		};
		class RscButton_1601: RscButton
		{
			idc = 1601;
			text = "<"; 
			action = "[]call admin_inventory_remove";
			x = 0.571988 * safezoneW + safezoneX;
			y = 0.431997 * safezoneH + safezoneY;
			w = 0.023996 * safezoneW;
			h = 0.0510023 * safezoneH;
		};
		class RscEdit_1400: RscEdit
		{
			idc = 1400;
			text = "1";
			x = 0.571988 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.023996 * safezoneW;
			h = 0.0510023 * safezoneH;
		};
	};
};

class admin_vehicles
{
	idd = 111;
	movingEnable = true;
	objects[] = {};
	onLoad = "uiNamespace setVariable ['admin_vehicles', _this select 0]";

	class controls
	{
		class dummybutton : RscDummy {idc = 6;};
		class RscBackground_2200: RscBackground
		{
			idc = 2200;
			x = 0.180053 * safezoneW + safezoneX;
			y = 0.210987 * safezoneH + safezoneY;
			w = 0.167972 * safezoneW;
			h = 0.561026 * safezoneH;
		};
		class RscBackground_2201: Rsc_lable
		{
			idc = 2201;
			text = ""; 
			x = 0.180053 * safezoneW + safezoneX;
			y = 0.176985 * safezoneH + safezoneY;
			w = 0.167972 * safezoneW;
			h = 0.0340016 * safezoneH;
		};
		class RscBackground_2202: RscBackground
		{
			idc = 2202;
			x = 0.356024 * safezoneW + safezoneX;
			y = 0.210987 * safezoneH + safezoneY;
			w = 0.463923 * safezoneW;
			h = 0.561026 * safezoneH;
		};
		class RscBackground_2203: Rsc_lable
		{
			idc = 2203;
			x = 0.356024 * safezoneW + safezoneX;
			y = 0.176985 * safezoneH + safezoneY;
			w = 0.463923 * safezoneW;
			h = 0.0340016 * safezoneH;
		};
		class RscCombo_2100: RscCombo
		{
			idc = 2100;
			x = 0.188052 * safezoneW + safezoneX;
			y = 0.227987 * safezoneH + safezoneY;
			w = 0.143976 * safezoneW;
			h = 0.0340016 * safezoneH;
		};
		class RscListbox_1500: RscListBox
		{
			idc = 1500;
			x = 0.188052 * safezoneW + safezoneX;
			y = 0.27899 * safezoneH + safezoneY;
			w = 0.143976 * safezoneW;
			h = 0.476022 * safezoneH;
			colorSelectBackground[] = {0.5,0,0,0.5};
			onLBSelChanged = "_this call admin_exec1;";
		};
		class RscListbox_1501: RscListBox
		{
			idc = 1501;
			x = 0.372021 * safezoneW + safezoneX;
			y = 0.227987 * safezoneH + safezoneY;
			w = 0.18397 * safezoneW;
			h = 0.527024 * safezoneH;
			colorSelectBackground[] = {0.5,0,0,0.5};
		};
		class RscListbox_1502: RscListBox
		{
			idc = 1502;
			x = 0.611982 * safezoneW + safezoneX;
			y = 0.227987 * safezoneH + safezoneY;
			w = 0.191968 * safezoneW;
			h = 0.527024 * safezoneH;
			colorSelectBackground[] = {0.5,0,0,0.5};
		};
		class RscButton_1600: RscButton
		{
			idc = 1600;
			text = ">"; 
			x = 0.571988 * safezoneW + safezoneX;
			y = 0.363994 * safezoneH + safezoneY;
			w = 0.023996 * safezoneW;
			h = 0.0510023 * safezoneH;
		};
		class RscButton_1601: RscButton
		{
			idc = 1601;
			text = ">"; 
			x = 0.571988 * safezoneW + safezoneX;
			y = 0.431997 * safezoneH + safezoneY;
			w = 0.023996 * safezoneW;
			h = 0.0510023 * safezoneH;
		};
		class RscButton_1602: RscButton
		{
			idc = 1602;
			text = "C"; 
			x = 0.571988 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.023996 * safezoneW;
			h = 0.0510023 * safezoneH;
			action = "[]call admin_vehicles_create";
		};
	};
};


class admin_update
{
	idd = 111;
	movingEnable = true;
	objects[] = {};
	class controls
	{	
		class dummybutton : RscDummy {idc = 2;};
		class RscBackground_2200: RscBackground
		{
			idc = 2200;
			x = 0.180053 * safezoneW + safezoneX;
			y = 0.210987 * safezoneH + safezoneY;
			w = 0.167972 * safezoneW;
			h = 0.561026 * safezoneH;
		};
		class RscBackground_2201: Rsc_lable
		{
			idc = 2201;
			
			x = 0.180053 * safezoneW + safezoneX;
			y = 0.176985 * safezoneH + safezoneY;
			w = 0.167972 * safezoneW;
			h = 0.0340016 * safezoneH;
		};
		class RscBackground_2202: RscBackground
		{
			idc = 2202;
			x = 0.356024 * safezoneW + safezoneX;
			y = 0.210987 * safezoneH + safezoneY;
			w = 0.463923 * safezoneW;
			h = 0.561026 * safezoneH;
		};
		class RscBackground_2203: Rsc_lable
		{
			idc = 2203;
			x = 0.356024 * safezoneW + safezoneX;
			y = 0.176985 * safezoneH + safezoneY;
			w = 0.463923 * safezoneW;
			h = 0.0340016 * safezoneH;
		};
		class RscCombo_2100: RscCombo
		{
			idc = 2100;
			x = 0.188052 * safezoneW + safezoneX;
			y = 0.227987 * safezoneH + safezoneY;
			w = 0.143976 * safezoneW;
			h = 0.0340016 * safezoneH;
		};
		class RscListbox_1500: RscListBox
		{
			idc = 1500;
			x = 0.188052 * safezoneW + safezoneX;
			y = 0.27899 * safezoneH + safezoneY;
			w = 0.143976 * safezoneW;
			h = 0.476022 * safezoneH;
			colorSelectBackground[] = {0.5,0,0,0.5};
			onLBSelChanged = "_this call admin_exec1;";
		};
		class RscEdit_1400: RscEdit
		{
			idc = 1400;
			x = 0.373461 * safezoneW + safezoneX;
			y = 0.227987 * safezoneH + safezoneY;
			w = 0.42393 * safezoneW;
			h = 0.238011 * safezoneH;
			style = ST_LEFT+ST_MULTI;
			htmlControl = true;
			autocomplete = "scripting";
		};
		class RscListbox_1501: RscListBox
		{
			idc = 1501;
			onLBSelChanged = "_this call admin_update_handler;";
			x = 0.372021 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.439927 * safezoneW;
			h = 0.204009 * safezoneH;
			colorSelectBackground[] = {0.5,0,0,0.5};
		};
		class RscButton_1600: RscButton
		{
			idc = 1600;
			text = "Server"; 
			action = "['SERVER']call admin_update";			
			x = 0.372021 * safezoneW + safezoneX;
			y = 0.72101 * safezoneH + safezoneY;
			w = 0.135977 * safezoneW;
			h = 0.0340016 * safezoneH;
		};
		class RscButton_1601: RscButton
		{
			idc = 1601;
			text = "All"; 
			action = "['ALL']call admin_update";			
			x = 0.515997 * safezoneW + safezoneX;
			y = 0.72101 * safezoneH + safezoneY;
			w = 0.143976 * safezoneW;
			h = 0.0340016 * safezoneH;
		};
		class RscButton_1602: RscButton
		{
			idc = 1602;
			text = "Client"; 
			action = "[(call compile lbData [2100, lbCurSel 2100]select 1)]call admin_update";
			x = 0.667972 * safezoneW + safezoneX;
			y = 0.72101 * safezoneH + safezoneY;
			w = 0.143976 * safezoneW;
			h = 0.0340016 * safezoneH;
		};
	};
};

class admin_sound
{
	idd = -1;
	class ControlsBackground{};
	class Controls
	{
		class dummybutton : RscDummy 
		{
			idc = 2;
		};
		class RscBackground_2200 : RscBackground 
		{
			idc = 2200;
			x = 0.180053*safezoneW+safezoneX;
			y = 0.210987*safezoneH+safezoneY;
			w = 0.167972*safezoneW;
			h = 0.561026*safezoneH;
			
		};
		class RscBackground_2201 : Rsc_lable 
		{
			idc = 2201;
			x = 0.180053*safezoneW+safezoneX;
			y = 0.176985*safezoneH+safezoneY;
			w = 0.167972*safezoneW;
			h = 0.0340016*safezoneH;
			
		};
		class RscBackground_2202 : RscBackground 
		{
			idc = 2202;
			x = safeZoneX + safeZoneW * 0.35625;
			y = safeZoneY + safeZoneH * 0.21111112;
			w = safeZoneW * 0.46375;
			h = safeZoneH * 0.56111112;
			
		};
		class RscBackground_2203 : Rsc_lable 
		{
			idc = 2203;
			x = 0.356024*safezoneW+safezoneX;
			y = 0.176985*safezoneH+safezoneY;
			w = 0.463923*safezoneW;
			h = 0.0340016*safezoneH;
			
		};
		class RscCombo_2100 : RscCombo 
		{
			idc = 2100;
			x = 0.188052*safezoneW+safezoneX;
			y = 0.227987*safezoneH+safezoneY;
			w = 0.143976*safezoneW;
			h = 0.0340016*safezoneH;
		};
		class RscListbox_1500 : RscListBox 
		{
			idc = 1500;
			x = 0.188052*safezoneW+safezoneX;
			y = 0.27899*safezoneH+safezoneY;
			w = 0.143976*safezoneW;
			h = 0.476022*safezoneH;
			colorSelectBackground[] = {0.5,0,0,0.5};
			onLBSelChanged = "_this call admin_exec1;";
		};
		class RscEdit_1400 : RscEdit 
		{
			idc = 1400;
			x = safeZoneX + safeZoneW * 0.668125;
			y = safeZoneY + safeZoneH * 0.52555556;
			w = safeZoneW * 0.14875;
			h = safeZoneH * 0.03111112;
			style = 0+16;
		};
		class RscListbox_1501 : RscListBox 
		{
			idc = 1501;
			x = safeZoneX + safeZoneW * 0.371875;
			y = safeZoneY + safeZoneH * 0.23111112;
			w = safeZoneW * 0.19;
			h = safeZoneH * 0.52222223;
			colorSelectBackground[] = {0.5,0,0,0.5};
			onLBSelChanged = "_this call admin_sound_change;";
		};
		class RscButton_1600 : RscButton 
		{
			idc = 1600;
			x = safeZoneX + safeZoneW * 0.6675;
			y = safeZoneY + safeZoneH * 0.67222223;
			w = safeZoneW * 0.140625;
			h = safeZoneH * 0.03444445;
			text = "Server";
			action = "";
			
		};
		class RscButton_1601 : RscButton 
		{
			idc = 1603;
			x = safeZoneX + safeZoneW * 0.66625;
			y = safeZoneY + safeZoneH * 0.57444445;
			w = safeZoneW * 0.14375;
			h = safeZoneH * 0.03444445;
			text = "Change Mode";
			action = "";
			
		};
		class RscButton_1602 : RscButton 
		{
			idc = 1602;
			x = safeZoneX + safeZoneW * 0.668125;
			y = safeZoneY + safeZoneH * 0.72111112;
			w = safeZoneW * 0.14375;
			h = safeZoneH * 0.03444445;
			text = "Client";
			action = "";
			
		};
		class RscButton_1601_copy1 : RscButton 
		{
			idc = 1601;
			x = safeZoneX + safeZoneW * 0.66625;
			y = safeZoneY + safeZoneH * 0.62333334;
			w = safeZoneW * 0.14375;
			h = safeZoneH * 0.03444445;
			text = "All";
			action = "";
			
		};
		
	};
	
};

class admin_menu
{
	idd = -1;
	
	class ControlsBackground
	{
		class RscBackground_2201 : Rsc_lable 
		{
			idc = 2201;
			x = 0.180053*safezoneW+safezoneX;
			y = 0.176985*safezoneH+safezoneY;
			w = 0.167972*safezoneW;
			h = 0.0340016*safezoneH;
			
		};
		class RscBackground_2200 : RscBackground 
		{
			idc = 2200;
			x = 0.180053*safezoneW+safezoneX;
			y = 0.210987*safezoneH+safezoneY;
			w = 0.167972*safezoneW;
			h = 0.561026*safezoneH;
			
		};
		
	};
	class Controls
	{
		class dummybutton : RscDummy 
		{
			idc = 2;
			
		};
		class RscCombo_2100 : RscCombo 
		{
			idc = 2100;
			x = 0.188052*safezoneW+safezoneX;
			y = 0.227987*safezoneH+safezoneY;
			w = 0.143976*safezoneW;
			h = 0.0340016*safezoneH;
			colorDisabled[] = {0.2,0.2,0.2,1};			
		};
		class RscListbox_1500 : RscListBox 
		{
			idc = 1500;
			x = 0.188052*safezoneW+safezoneX;
			y = 0.27899*safezoneH+safezoneY;
			w = 0.143976*safezoneW;
			h = 0.476022*safezoneH;
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorSelectBackground[] = {0.5,0,0,0.5};
			onLBSelChanged = "_this call admin_exec1;";			
		};
		
	};
	
};



