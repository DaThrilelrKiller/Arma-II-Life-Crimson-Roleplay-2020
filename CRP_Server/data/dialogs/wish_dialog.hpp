class wish_dialog
{
	idd = -1;
	
	class ControlsBackground
	{
		class RscBackground_2200 : RscBackground 
		{
			idc = 2200;
			x = safeZoneX + safeZoneW * 0.43;
			y = safeZoneY + safeZoneH * 0.21111112;
			w = safeZoneW * 0.161875;
			h = safeZoneH * 0.56111112;
			
		};
		
	};
	class Controls
	{
		class lb_information : RscListBox 
		{
			idc = 897;
			x = safeZoneX + safeZoneW * 0.44;
			y = safeZoneY + safeZoneH * 0.22222223;
			w = safeZoneW * 0.14375;
			h = safeZoneH * 0.53777778;
			onLBSelChanged = "[]call well_exec;";
		};
		class lable_shop : Rsc_lable 
		{
			idc = 2201;
			x = safeZoneX + safeZoneW * 0.43;
			y = safeZoneY + safeZoneH * 0.17666667;
			w = safeZoneW * 0.1625;
			h = safeZoneH * 0.03444445;
			text = "";
			
		};
		class close : RscButton 
		{
			idc = 1602;
			x = safeZoneX + safeZoneW * 0.57375;
			y = safeZoneY + safeZoneH * 0.17555556;
			w = safeZoneW * 0.016875;
			h = safeZoneH * 0.03333334;
			text = "X";
			colorBackground[] = {1,1,1,0};
			colorBackgroundActive[] = {1,1,1,0};
			colorBorder[] = {1,1,1,0};
			colorDisabled[] = {0.5,0,0,0};
			colorFocused[] = {1,1,1,0};
			colorShadow[] = {0,0,0,0};
			sizeEx = 0.07;
		};
		
	};
	
};