class hooker_diaglog
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
			sizeEx = (((((safezoneW/safezoneH)min1.2)/1.2)/25)*1);
			
		};
		class button_talk : RscButton
		{
			type = 1;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.44;
			y = safeZoneY + safeZoneH * 0.23;
			w = safeZoneW * 0.143125;
			h = safeZoneH * 0.03666667;
			style = 0+2;
			text = "Talk";
			borderSize = 0;
			colorBackground[] = {0.6,0,0,1};
			colorBackgroundActive[] = {0.6,0,0,1};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
			colorBorder[] = {0.6,0,0,1};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorFocused[] = {0.2,0.2,0.2,1};
			colorShadow[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "Zeppelin32";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class button_follow: RscButton
		{
			type = 1;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.44;
			y = safeZoneY + safeZoneH * 0.27888889;
			w = safeZoneW * 0.143125;
			h = safeZoneH * 0.03666667;
			style = 0+2;
			text = "Follow";
			borderSize = 0;
			colorBackground[] = {0.6,0,0,1};
			colorBackgroundActive[] = {0.6,0,0,1};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
			colorBorder[] = {0.6,0,0,1};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorFocused[] = {0.2,0.2,0.2,1};
			colorShadow[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "Zeppelin32";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class button_move: RscButton
		{
			type = 1;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.44;
			y = safeZoneY + safeZoneH * 0.32777778;
			w = safeZoneW * 0.143125;
			h = safeZoneH * 0.03666667;
			style = 0+2;
			text = "Move";
			borderSize = 0;
			colorBackground[] = {0.6,0,0,1};
			colorBackgroundActive[] = {0.6,0,0,1};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
			colorBorder[] = {0.6,0,0,1};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorFocused[] = {0.2,0.2,0.2,1};
			colorShadow[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "Zeppelin32";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class button_wait: RscButton
		{
			type = 1;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.44;
			y = safeZoneY + safeZoneH * 0.37666667;
			w = safeZoneW * 0.143125;
			h = safeZoneH * 0.03666667;
			style = 0+2;
			text = "Wait";
			borderSize = 0;
			colorBackground[] = {0.6,0,0,1};
			colorBackgroundActive[] = {0.6,0,0,1};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
			colorBorder[] = {0.6,0,0,1};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorFocused[] = {0.2,0.2,0.2,1};
			colorShadow[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "Zeppelin32";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class button_storage: RscButton
		{
			type = 1;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.44;
			y = safeZoneY + safeZoneH * 0.42555556;
			w = safeZoneW * 0.143125;
			h = safeZoneH * 0.03666667;
			style = 0+2;
			text = "Storage";
			borderSize = 0;
			colorBackground[] = {0.6,0,0,1};
			colorBackgroundActive[] = {0.6,0,0,1};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
			colorBorder[] = {0.6,0,0,1};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorFocused[] = {0.2,0.2,0.2,1};
			colorShadow[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "Zeppelin32";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class button_work: RscButton
		{
			type = 1;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.44;
			y = safeZoneY + safeZoneH * 0.47444445;
			w = safeZoneW * 0.143125;
			h = safeZoneH * 0.03666667;
			style = 0+2;
			text = "Go work the corner";
			borderSize = 0;
			colorBackground[] = {0.6,0,0,1};
			colorBackgroundActive[] = {0.6,0,0,1};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
			colorBorder[] = {0.6,0,0,1};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorFocused[] = {0.2,0.2,0.2,1};
			colorShadow[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "Zeppelin32";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class button_sell: RscButton
		{
			type = 1;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.44;
			y = safeZoneY + safeZoneH * 0.52333334;
			w = safeZoneW * 0.143125;
			h = safeZoneH * 0.03666667;
			style = 0+2;
			text = "Sell Hooker";
			borderSize = 0;
			colorBackground[] = {0.6,0,0,1};
			colorBackgroundActive[] = {0.6,0,0,1};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
			colorBorder[] = {0.6,0,0,1};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorFocused[] = {0.2,0.2,0.2,1};
			colorShadow[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "Zeppelin32";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class button_rob: RscButton
		{
			type = 1;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.44;
			y = safeZoneY + safeZoneH * 0.57222223;
			w = safeZoneW * 0.143125;
			h = safeZoneH * 0.03666667;
			style = 0+2;
			text = "Rob Hooker";
			borderSize = 0;
			colorBackground[] = {0.6,0,0,1};
			colorBackgroundActive[] = {0.6,0,0,1};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
			colorBorder[] = {0.6,0,0,1};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorFocused[] = {0.2,0.2,0.2,1};
			colorShadow[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "Zeppelin32";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class button_home: RscButton
		{
			type = 1;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.44;
			y = safeZoneY + safeZoneH * 0.62111112;
			w = safeZoneW * 0.143125;
			h = safeZoneH * 0.03666667;
			style = 0+2;
			text = "Go Home";
			borderSize = 0;
			colorBackground[] = {0.6,0,0,1};
			colorBackgroundActive[] = {0.6,0,0,1};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
			colorBorder[] = {0.6,0,0,1};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorFocused[] = {0.2,0.2,0.2,1};
			colorShadow[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "Zeppelin32";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class button_settings: RscButton
		{
			type = 1;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.44;
			y = safeZoneY + safeZoneH * 0.67;
			w = safeZoneW * 0.143125;
			h = safeZoneH * 0.03666667;
			style = 0+2;
			text = "Settings";
			borderSize = 0;
			colorBackground[] = {0.6,0,0,1};
			colorBackgroundActive[] = {0.6,0,0,1};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
			colorBorder[] = {0.6,0,0,1};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorFocused[] = {0.2,0.2,0.2,1};
			colorShadow[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "Zeppelin32";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class text_owner
		{
			type = 13;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.44375;
			y = safeZoneY + safeZoneH * 0.73444445;
			w = safeZoneW * 0.1375;
			h = safeZoneH * 0.06111112;
			style = 2+16;
			text = "Suggar Daddy:  DaThrillerKiller";
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			colorBackground[] = {1,1,1,0};
			class Attributes
			{
				
			};
			
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
