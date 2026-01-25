class shipment_open
{
	idd = 162;
	movingEnable = true;
	objects[] = {};
	
	class controlsBackground 
	{
		class dtk_map01 : dtkMap 
			{ 
				idc = 56; 
				type = CT_MAP_MAIN; 
				style = ST_PICTURE; 
				x = 0.356024 * safezoneW + safezoneX;
				y = 0.210987 * safezoneH + safezoneY;
				w = 0.463923 * safezoneW;
				h = 0.561026 * safezoneH;	
			};	
	};
	
	class controls
	{	
	
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
			colorSelectBackground[] = {0.5,0,0,0.5};
			onLBSelChanged = "[]call shipment_update_map;";

			x = 0.188052 * safezoneW + safezoneX;
			y = 0.27899 * safezoneH + safezoneY;
			w = 0.143976 * safezoneW;
			h = 0.22101 * safezoneH;
		};
		class RscButton_1602: RscButton
		{
			idc = 1602;

			text = "Start Shimpment Mission"; 
			action = "call shipment_add;";
			x = 0.603983 * safezoneW + safezoneX;
			y = 0.72101 * safezoneH + safezoneY;
			w = 0.207966 * safezoneW;
			h = 0.0340016 * safezoneH;
		};
		class RscListbox_1501: RscListBox
		{
			idc = 1501;
			colorSelectBackground[] = {0.5,0,0,0.5};

			x = 0.188052 * safezoneW + safezoneX;
			y = 0.517001 * safezoneH + safezoneY;
			w = 0.143976 * safezoneW;
			h = 0.238011 * safezoneH;
		};
	};
};
