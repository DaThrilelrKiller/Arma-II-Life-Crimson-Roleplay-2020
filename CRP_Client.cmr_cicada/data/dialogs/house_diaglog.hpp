class house_dealer
{
	idd = -1;
	onUnload = " house_cam cameraEffect ['terminate','back']; ";
	
	class ControlsBackground
	{
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
			x = safeZoneX + safeZoneW * 0.35625;
			y = safeZoneY + safeZoneH * 0.17666667;
			w = safeZoneW * 0.46375;
			h = safeZoneH * 0.03444445;
			
		};
		
	};
	class Controls
	{
		class Control445857767: Swag_RscButton
		{
			type = 1;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.805;
			y = safeZoneY + safeZoneH * 0.17222223;
			w = safeZoneW * 0.0125;
			h = safeZoneH * 0.03666667;
			text = "X";	
		};
		class RscListbox_1501 : RscListNBox 
		{
			idc = 1501;
			x = safeZoneX + safeZoneW * 0.371875;
			y = safeZoneY + safeZoneH * 0.23111112;
			w = safeZoneW * 0.44;
			h = safeZoneH * 0.47333334;
			columns[] = {0,0.3,0.5}; 
			onLBSelChanged = "call house_preview";
		};
		class RscButton_1601 : RscButton 
		{
			idc = 1601;
			x = safeZoneX + safeZoneW * 0.66625;
			y = safeZoneY + safeZoneH * 0.72111112;
			w = safeZoneW * 0.14375;
			h = safeZoneH * 0.03444445;
			text = "Buy House";
			action = "(lnbData [1501, [lnbCurSelRow 1501, 0]])call house_buy;";
			
		};
		
	};
};


class house_menu
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
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorSelectBackground[] = {0.5,0,0,0.5};
			onLBSelChanged = "[]call house_handler;";
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
			action = "closeDialog 0";
			
		};
		
	};
	
};