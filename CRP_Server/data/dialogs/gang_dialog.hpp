class gang_menu1
{
	idd = -1;
	
	class ControlsBackground
	{
		class Control1024868412
		{
			type = 0;
			idc = -1;
			x = safeZoneX+safeZoneW*0.29375;
			y = safeZoneY+safeZoneH*0.22555556;
			w = safeZoneW*0.4125;
			h = safeZoneH*0.55;
			style = 0;
			text = "";
			colorBackground[] = {0,0,0,0.6};
			colorText[] = {1,1,1,1};
			font = "Zeppelin32";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class Control259768958
		{
			type = 0;
			idc = -1;
			x = safeZoneX+safeZoneW*0.29375;
			y = safeZoneY+safeZoneH*0.19888889;
			w = safeZoneW*0.4125;
			h = safeZoneH*0.03666667;
			style = 0;
			text = "";
			colorBackground[] = {0.6,0,0,1};
			colorText[] = {0.3608,0.2392,0.5255,1};
			font = "Zeppelin32";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		
	};
	class Controls
	{
		class Control974541917
		{
			type = 0;
			idc = 1;
			x = safeZoneX+safeZoneW*0.310625;
			y = safeZoneY+safeZoneH*0.26111112;
			w = safeZoneW*0.1575;
			h = safeZoneH*0.03666667;
			style = 0;
			text = "Gangs";
			colorBackground[] = {0.6,0,0,1};
			colorText[] = {1,1,1,1};
			font = "Zeppelin32";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class Control974541917_copy1
		{
			type = 0;
			idc = 3;
			x = safeZoneX+safeZoneW*0.310625;
			y = safeZoneY+safeZoneH*0.53;
			w = safeZoneW*0.1575;
			h = safeZoneH*0.03666667;
			style = 0;
			text = "Players";
			colorBackground[] = {0.6,0,0,1};
			colorText[] = {1,1,1,1};
			font = "Zeppelin32";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class RscListBox1 : RscListBox 
		{
			type = 5;
			idc = 4;
			x = safeZoneX+safeZoneW*0.31125;
			y = safeZoneY+safeZoneH*0.56666667;
			w = safeZoneW*0.1575;
			h = safeZoneH*0.18888889;
			style = 16;
			colorBackground[] = {0,0,0,0.6};
			colorDisabled[] = {0,0,0,0};
			colorSelect[] = {1,1,1,1};
			colorText[] = {0.6,0,0,1};
			font = "Zeppelin32";
			maxHistoryDelay = 0;
			rowHeight = 0;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class RscListBox2 : RscListBox 
		{
			type = 5;
			idc = 2;
			x = safeZoneX+safeZoneW*0.311875;
			y = safeZoneY+safeZoneH*0.29777778;
			w = safeZoneW*0.1575;
			h = safeZoneH*0.21333334;
			style = 16;
			colorBackground[] = {0,0,0,0.6};
			colorDisabled[] = {0,0,0,0};
			colorSelect[] = {1,1,1,1};
			colorText[] = {0.6,0,0,1};
			font = "Zeppelin32";
			maxHistoryDelay = 0;
			rowHeight = 0;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			onLBSelChanged = "_this call gang_refresh;";
			
		};
		class RscButton1 : RscButton 
		{
			type = 1;
			idc = 6;
			x = safeZoneX + safeZoneW * 0.530625;
			y = safeZoneY + safeZoneH * 0.46;
			w = safeZoneW * 0.1125;
			h = safeZoneH * 0.03666667;
			style = 0+2;
			text = "create /rename";
			borderSize = 0;
			colorBackground[] = {0.6,0,0,1};
			colorBackgroundActive[] = {0.6,0,0,1};
			colorBackgroundDisabled[] = {0.6,0,0,0.8};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {1,1,1,0.5};
			colorFocused[] = {0.2,0.2,0.2,1};
			colorShadow[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "Zeppelin32";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class RscButton2 : RscButton 
		{
			type = 1;
			idc = 12;
			x = safeZoneX + safeZoneW * 0.530625;
			y = safeZoneY + safeZoneH * 0.70444445;
			w = safeZoneW * 0.1125;
			h = safeZoneH * 0.03666667;
			style = 0+2;
			text = "Establish Southern Goverment";
			borderSize = 0;
			colorBackground[] = {0.6,0,0,1};
			colorBackgroundActive[] = {0.6,0,0,1};
			colorBackgroundDisabled[] = {0.6,0,0,0.8};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {1,1,1,0.5};
			colorFocused[] = {0.2,0.2,0.2,1};
			colorShadow[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "Zeppelin32";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class RscButton3 : RscButton 
		{
			type = 1;
			idc = 8;
			x = safeZoneX + safeZoneW * 0.530625;
			y = safeZoneY + safeZoneH * 0.55777778;
			w = safeZoneW * 0.1125;
			h = safeZoneH * 0.03666667;
			style = 0+2;
			text = "Kick";
			borderSize = 0;
			colorBackground[] = {0.6,0,0,1};
			colorBackgroundActive[] = {0.6,0,0,1};
			colorBackgroundDisabled[] = {0.6,0,0,0.8};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {1,1,1,0.5};
			colorFocused[] = {0.2,0.2,0.2,1};
			colorShadow[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "Zeppelin32";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class RscButton4 : RscButton 
		{
			type = 1;
			idc = 9;
			x = safeZoneX + safeZoneW * 0.530625;
			y = safeZoneY + safeZoneH * 0.60666667;
			w = safeZoneW * 0.1125;
			h = safeZoneH * 0.03666667;
			style = 0+2;
			text = "Lock";
			borderSize = 0;
			colorBackground[] = {0.6,0,0,1};
			colorBackgroundActive[] = {0.6,0,0,1};
			colorBackgroundDisabled[] = {0.6,0,0,0.8};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {1,1,1,0.5};
			colorFocused[] = {0.2,0.2,0.2,1};
			colorShadow[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "Zeppelin32";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class RscButton5 : RscButton 
		{
			type = 1;
			idc = 7;
			x = safeZoneX + safeZoneW * 0.530625;
			y = safeZoneY + safeZoneH * 0.50888889;
			w = safeZoneW * 0.1125;
			h = safeZoneH * 0.03666667;
			style = 0+2;
			text = "Leave/Join";
			borderSize = 0;
			colorBackground[] = {0.6,0,0,1};
			colorBackgroundActive[] = {0.6,0,0,1};
			colorBackgroundDisabled[] = {0.6,0,0,0.8};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {1,1,1,0.5};
			colorFocused[] = {0.2,0.2,0.2,1};
			colorShadow[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "Zeppelin32";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class RedEdit1 : RscEdit 
		{
			type = 2;
			idc = 5;
			x = safeZoneX + safeZoneW * 0.531875;
			y = safeZoneY + safeZoneH * 0.39666667;
			w = safeZoneW * 0.1125;
			h = safeZoneH * 0.03666667;
			style = 0+0;
			text = "";
			autocomplete = "";
			colorBackground[] = {0.6,0,0,0};
			colorDisabled[] = {0.6,0,0,0};
			colorSelection[] = {0.6,0,0,1};
			colorText[] = {1,1,1,1};
			font = "Zeppelin32";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class RscButton6 : RscButton 
		{
			type = 1;
			idc = 11;
			x = safeZoneX + safeZoneW * 0.53;
			y = safeZoneY + safeZoneH * 0.33777778;
			w = safeZoneW * 0.1125;
			h = safeZoneH * 0.03666667;
			style = 0+2;
			text = "SetRank";
			borderSize = 0;
			colorBackground[] = {0.6,0,0,1};
			colorBackgroundActive[] = {0.6,0,0,1};
			colorBackgroundDisabled[] = {0.6,0,0,0.8};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {1,1,1,0.5};
			colorFocused[] = {0.2,0.2,0.2,1};
			colorShadow[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "Zeppelin32";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class RscButton2_copy1 : RscButton 
		{
			type = 1;
			idc = 10;
			x = safeZoneX + safeZoneW * 0.530625;
			y = safeZoneY + safeZoneH * 0.65555556;
			w = safeZoneW * 0.1125;
			h = safeZoneH * 0.03666667;
			style = 0+2;
			text = "Invite";
			borderSize = 0;
			colorBackground[] = {0.6,0,0,1};
			colorBackgroundActive[] = {0.6,0,0,1};
			colorBackgroundDisabled[] = {0.6,0,0,0.8};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {1,1,1,0.5};
			colorFocused[] = {0.2,0.2,0.2,1};
			colorShadow[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "Zeppelin32";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		
	};
	
};