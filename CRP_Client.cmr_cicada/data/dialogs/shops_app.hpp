class shops_app_menu
{
	idd = 114;
	movingEnable = true;
	objects[] = {};
	class controls
	{	
		class RscBackground_2202: RscBackground
		{
			idc = 2202;
			x = 0.25 * safezoneW + safezoneX;
			y = 0.15 * safezoneH + safezoneY;
			w = 0.5 * safezoneW;
			h = 0.7 * safezoneH;
		};
		class RscBackground_2203: Rsc_lable
		{
			idc = 2203;
			text = "Shop Demand & Inventory"; 
			x = 0.25 * safezoneW + safezoneX;
			y = 0.13 * safezoneH + safezoneY;
			w = 0.5 * safezoneW;
			h = 0.0339976 * safezoneH;
		};
		
		class RscListBox_3000: RscListBox
		{
			idc = 3000;
			x = 0.27 * safezoneW + safezoneX;
			y = 0.2 * safezoneH + safezoneY;
			w = 0.46 * safezoneW;
			h = 0.55 * safezoneH;
		};
		
		class RscButton_3001: RscButton
		{
			idc = 3001;
			text = "Refresh";
			x = 0.27 * safezoneW + safezoneX;
			y = 0.76 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;
			action = "call shops_app_refresh";
		};
		
		class RscButton_3002: RscButton
		{
			idc = 3002;
			text = "Sort by Demand";
			x = 0.38 * safezoneW + safezoneX;
			y = 0.76 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;
			action = "shops_app_sortMode = 'demand'; call shops_app_refresh";
		};
		
		class RscButton_3003: RscButton
		{
			idc = 3003;
			text = "Sort by Profit";
			x = 0.49 * safezoneW + safezoneX;
			y = 0.76 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;
			action = "shops_app_sortMode = 'profit'; call shops_app_refresh";
		};
		
		class RscButton_3004: RscButton
		{
			idc = 3004;
			text = "Sort by Stock";
			x = 0.6 * safezoneW + safezoneX;
			y = 0.76 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;
			action = "shops_app_sortMode = 'stock'; call shops_app_refresh";
		};
		
		class RscButton_3005: RscButton
		{
			idc = 3005;
			text = "Close";
			x = 0.63 * safezoneW + safezoneX;
			y = 0.76 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;
			action = "closeDialog 0";
		};
	};
};
