class shopping
{
	idd = 24;
	movingEnable = false;
	
	class ControlsBackground
	{
		class RscBackground_2200 : RscBackground 
		{
			idc = 2200;
			x = safeZoneX+safeZoneW*0.28;
			y = safeZoneY+safeZoneH*0.21111112;
			w = safeZoneW*0.436875;
			h = safeZoneH*0.56111112;
			
		};
		
	};
	class Controls
	{
		class Control2125696138
		{
			type = 0;
			idc = 20;
			x = safeZoneX+safeZoneW*0.76875;
			y = safeZoneY+safeZoneH*1.00666667;
			w = safeZoneW*0.4125;
			h = safeZoneH*0.55;
			style = 0+48;
			text = "";
			colorBackground[] = {0.6784,0.5412,0.3176,1};
			colorText[] = {0.3216,0.4588,0.6824,1};
			font = "Zeppelin32";
			sizeEx = 0;
		};
		class Control1247094145: RscEdit
		{
			type = 2;
			idc = 12;
			x = safeZoneX + safeZoneW * 0.289375;
			y = safeZoneY + safeZoneH * 0.66888889;
			w = safeZoneW * 0.140625;
			h = safeZoneH * 0.03666667;
			style = 0;
			text = "1";
			autocomplete = "";
			font = "Zeppelin32";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
		};
		class Control333913750 : RscButton
		{
			idc = 563;
			x = safeZoneX + safeZoneW * 0.29;
			y = safeZoneY + safeZoneH * 0.71888889;
			w = safeZoneW * 0.13875;
			h = safeZoneH * 0.03666667;
			text = "Buy/Sell";
			action = "call shops_button";
			
		};
		class select_storage : RscCombo 
		{
			idc = 2100;
			x = safeZoneX+safeZoneW*0.288125;
			y = safeZoneY+safeZoneH*0.22777778;
			w = safeZoneW*0.14375;
			h = safeZoneH*0.03444445;
			onLBSelChanged = "call shops_refresh";
		};
		class lb_information : RscListBox 
		{
			idc = 303;
			x = safeZoneX + safeZoneW * 0.44;
			y = safeZoneY + safeZoneH * 0.26444445;
			w = safeZoneW * 0.26875;
			h = safeZoneH * 0.49555556;
		};
		class lb_items : RscListBox 
		{
			idc = 301;
			x = safeZoneX + safeZoneW * 0.288125;
			y = safeZoneY + safeZoneH * 0.32777778;
			w = safeZoneW * 0.14375;
			h = safeZoneH * 0.33333334;
			onLBSelChanged = "call shops_lbChanged";
		};
		class lable_shop : Rsc_lable 
		{
			idc = 2201;
			x = safeZoneX + safeZoneW * 0.28;
			y = safeZoneY + safeZoneH * 0.17666667;
			w = safeZoneW * 0.4375;
			h = safeZoneH * 0.03444445;
			text = "";
			
		};
		class close : RscButton 
		{
			idc = 1602;
			x = safeZoneX+safeZoneW*0.69875;
			y = safeZoneY+safeZoneH*0.17555556;
			w = safeZoneW*0.016875;
			h = safeZoneH*0.03333334;
			text = "X";
			action = "closeDialog 0";
			
		};
		class lable_info_copy1 : Rsc_lable 
		{
			idc = 2201;
			x = safeZoneX+safeZoneW*0.44;
			y = safeZoneY+safeZoneH*0.23111112;
			w = safeZoneW*0.26875;
			h = safeZoneH*0.03444445;
			text = "Information";
			
		};
		class select_storage_copy1 : RscCombo 
		{
			type = 4;
			idc = 2101;
			x = safeZoneX+safeZoneW*0.288125;
			y = safeZoneY+safeZoneH*0.27666667;
			w = safeZoneW*0.14375;
			h = safeZoneH*0.03444445;
			onLBSelChanged = "call shops_refresh";
		};
	};
	
};

class store
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
			onLBSelChanged = "[]call shops_openshop;";
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