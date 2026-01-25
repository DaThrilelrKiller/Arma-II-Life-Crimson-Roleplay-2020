
class ar_hud
{
	idd = -1;
	fadeout=0;
	fadein=0;
	duration = 99999999999999999;
	name= "ar_hud";
	onLoad = "uiNamespace setVariable ['ar_hud', _this select 0]";
	objects[] = {};
	controls[] = {};
	
	class ControlsBackground
	{
		class Control913475649
		{
			type = 0;
			idc = 154;
			x = safeZoneX + safeZoneW * 0.00125;
			y = safeZoneY + safeZoneH * 0.94555556;
			w = safeZoneW * 0.996875;
			h = safeZoneH * 0.05111112;
			style = 2;
			text = "";
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "TahomaB";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
			shadow = 1;
			
		};
		
	};
	
};


	class kill_feed
	{
		idd = 286;
		fadeout=2;
		fadein=0;
		duration = 10;
		name= "kill_feed";
		onLoad = "uiNamespace setVariable ['kill_feed', _this select 0]";
		objects[] = {};
		controls[] = {};
		class controlsBackground 
		{	
			class text:RLRPG_MainHUD_RscText
			{
				idc = 3600;
				type = CT_STRUCTURED_TEXT;
				size = 0.040;
				x = safeZoneX;
				y = safeZoneY;
				w = SafeZoneW; 
				h = SafeZoneH;
				colorText[] = {1,1,1,1};
				lineSpacing = 3;
				colorBackground[] = {0,0,0,0};
				text = "";
				shadow = 2;
				class Attributes {
					align = "center";
				};
			};
		};
	};
	
	class better_chat
	{
		idd = 59;
		fadeout=2;
		fadein=0;
		duration = 10;
		name= "better_chat";
		onLoad = "uiNamespace setVariable ['better_chat', _this select 0]";
		objects[] = {};
		controls[] = {};
		class controlsBackground 
		{	
			class text:RLRPG_MainHUD_RscText
			{
				idc = 20;
				type = CT_STRUCTURED_TEXT;
				size = 0.033;
				x = safeZoneX;
				y = safeZoneY;
				w = SafeZoneW * 0.4; 
				h = SafeZoneH;
				colorText[] = {1,1,1,1};
				colorBackground[] = {0,0,0,0};
				text = "";
				shadow = 2;
				align = "left";
				valign = "bottom";
				
				class Attributes {
					align = "left";
					valign = "bottom";
				};
			};
		};
	};
	
	class dtk_logo
	{
	idd = 200;
	fadeout=0;
	fadein=0;
	duration = 1000000000;
	name= "dtk_logo";
	onLoad = "uiNamespace setVariable ['dtk_logo', _this select 0]";
	
	class ControlsBackground
	{
		class Control841420291 : RscPicture
		{
			idc = 1;
			x = safeZoneX + safeZoneW * 0.29394532;
			y = safeZoneY + safeZoneH * 0.22569445;
			w = safeZoneW * 0.41210938;
			h = safeZoneH * 0.54861112;
			text = "data\images\logo.paa";
		};
		
	};
	class Controls 	{};
	
	};

