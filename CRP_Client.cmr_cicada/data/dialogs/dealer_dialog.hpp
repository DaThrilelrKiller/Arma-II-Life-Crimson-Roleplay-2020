class dealer_menu
{
	idd = -1;
	
	class ControlsBackground
	{
		class Background : RscBackground
		{
			x = safeZoneX + safeZoneW * 0.34375;
			y = safeZoneY + safeZoneH * 0.24888889;
			w = safeZoneW * 0.3125;
			h = safeZoneH * 0.37111112;			
		};
		class Heder : Rsc_Lable
		{
			x = safeZoneX + safeZoneW * 0.34375;
			y = safeZoneY + safeZoneH * 0.22444445;
			w = safeZoneW * 0.3125;
			h = safeZoneH * 0.03666667;			
		};
		
	};
	class Controls
	{
		class btn_Sell : RscButton
		{
			x = safeZoneX + safeZoneW * 0.52375;
			y = safeZoneY + safeZoneH * 0.56555556;
			w = safeZoneW * 0.119375;
			h = safeZoneH * 0.03888889;
			text = "Sell Vehicle";
			action = "[]call dealer_sell;";
		};
		class btn_close
		{
			x = safeZoneX + safeZoneW * 0.62875;
			y = safeZoneY + safeZoneH * 0.22444445;
			w = safeZoneW * 0.02625;
			h = safeZoneH * 0.03888889;			
		};
		class Vehicle_Price : RscEdit
		{
			idc = 1;
			x = safeZoneX + safeZoneW * 0.354375;
			y = safeZoneY + safeZoneH * 0.56222223;
			w = safeZoneW * 0.158125;
			h = safeZoneH * 0.04;
			
		};
		class Vehicle_list : RscListBox
		{
			idc=2;
			x = safeZoneX + safeZoneW * 0.35375;
			y = safeZoneY + safeZoneH * 0.27333334;
			w = safeZoneW * 0.293125;
			h = safeZoneH * 0.27555556;				
		};
			
	};
		
};
