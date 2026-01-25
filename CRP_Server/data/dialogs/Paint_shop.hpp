class Paint_shop
{
	idd = 489;
	onUnload = "call paint_close";
	onLoad = "_this call display_keypress";
	
	class ControlsBackground
	{
		class RscBackground_2200 : RscBackground 
		{
			idc = 2200;
			x = safeZoneX + safeZoneW * 0.53;
			y = safeZoneY + safeZoneH * 0.06444445;
			w = safeZoneW * 0.243125;
			h = safeZoneH * 0.10444445;
			
		};
		class RscBackground_Camera : RscBackground 
		{
			idc = -1;
			x = safeZoneX+safeZoneW*0.805;
			y = safeZoneY+safeZoneH*0.06444445;
			w = safeZoneW*0.168125;
			h = safeZoneH*0.75666667;
			
		};
	};
	class Controls
	{
		class slider_blue : RscSliderH
		{
			idc = 10;
			x = safeZoneX + safeZoneW * 0.849375;
			y = safeZoneY + safeZoneH * 0.62555556;
			w = safeZoneW * 0.105625;
			h = safeZoneH * 0.01444445;
			style = 1024;
			color[] = {1,1,1,1};
			colorActive[] = {1,1,1,1};
			onSliderPosChanged = "[]call paint_preview";
		};
		class Control673134996
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.8125;
			y = safeZoneY + safeZoneH * 0.40777778;
			w = safeZoneW * 0.045625;
			h = safeZoneH * 0.02555556;
			style = 0;
			text = "Format";
			colorBackground[] = {0.5098,0.3255,0.3255,0};
			colorText[] = {1,1,1,1};
			font = "TahomaB";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class slider_red : RscSliderH
		{
			idc = 11;
			x = safeZoneX + safeZoneW * 0.849375;
			y = safeZoneY + safeZoneH * 0.54777778;
			w = safeZoneW * 0.105625;
			h = safeZoneH * 0.01444445;
			style = 1024;
			color[] = {1,1,1,1};
			colorActive[] = {1,1,1,1};
			onSliderPosChanged = "[]call paint_preview";
			
		};
		class Control673134996_copy1
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.815;
			y = safeZoneY + safeZoneH * 0.66333334;
			w = safeZoneW * 0.08875;
			h = safeZoneH * 0.02555556;
			style = 0;
			text = "Preview";
			colorBackground[] = {0.5098,0.3255,0.3255,0};
			colorText[] = {1,1,1,1};
			font = "TahomaB";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class slider_green : RscSliderH
		{
			idc = 12;
			x = safeZoneX + safeZoneW * 0.84875;
			y = safeZoneY + safeZoneH * 0.58444445;
			w = safeZoneW * 0.105625;
			h = safeZoneH * 0.01444445;
			style = 1024;
			color[] = {1,1,1,1};
			colorActive[] = {1,1,1,1};
			onSliderPosChanged = "[]call paint_preview";
			
		};
		class Control673134996_copy1_copy1
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.814375;
			y = safeZoneY + safeZoneH * 0.57666667;
			w = safeZoneW * 0.0275;
			h = safeZoneH * 0.02555556;
			style = 0;
			text = "Green";
			colorBackground[] = {0.5098,0.3255,0.3255,0};
			colorText[] = {0,1,0,1};
			font = "TahomaB";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class Control2069652979
		{
			type = 0;
			idc = 65;
			x = safeZoneX + safeZoneW * 0.859375;
			y = safeZoneY + safeZoneH * 0.66555556;
			w = safeZoneW * 0.029375;
			h = safeZoneH * 0.02888889;
			style = 0;
			text = "";
			colorBackground[] = {0.6078,0.3725,0.6745,1};
			colorText[] = {0.3922,0.6275,0.3255,1};
			font = "TahomaB";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class Control673134996_copy1_copy2
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.815;
			y = safeZoneY + safeZoneH * 0.61444445;
			w = safeZoneW * 0.0275;
			h = safeZoneH * 0.02555556;
			style = 0;
			text = "Blue";
			colorBackground[] = {0.5098,0.3255,0.3255,0};
			colorText[] = {0,0,1,1};
			font = "TahomaB";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class Control180235395 : RscButton
		{
			type = 1;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.9575;
			y = safeZoneY + safeZoneH * 0.03666667;
			w = safeZoneW * 0.01125;
			h = safeZoneH * 0.02;
			style = 0;
			text = "X";
			borderSize = 0;
			colorBackground[] = {0.2157,0.4431,0.7451,0};
			colorBackgroundActive[] = {1,0,0,1};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,0};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorFocused[] = {0.2,0.2,0.2,0};
			colorShadow[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "TahomaB";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			action = "CloseDialog 0";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class Control673134996_copy2
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.815;
			y = safeZoneY + safeZoneH * 0.54;
			w = safeZoneW * 0.020625;
			h = safeZoneH * 0.02555556;
			style = 0;
			text = "Red";
			colorBackground[] = {0.5098,0.3255,0.3255,0};
			colorText[] = {1,0,0,1};
			font = "TahomaB";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class Control673134996_copy3
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.8125;
			y = safeZoneY + safeZoneH * 0.33444445;
			w = safeZoneW * 0.020625;
			h = safeZoneH * 0.02555556;
			style = 0;
			text = "Style";
			colorBackground[] = {0.5098,0.3255,0.3255,0};
			colorText[] = {1,1,1,1};
			font = "TahomaB";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class dummybutton : RscDummy 
		{
			idc = 4;
			
		};
		class RscBackground_2201 : Rsc_lable 
		{
			idc = 2201;
			x = safeZoneX + safeZoneW * 0.805;
			y = safeZoneY + safeZoneH * 0.07888889;
			w = safeZoneW * 0.168125;
			h = safeZoneH * 0.03444445;
			text = "Selection";
			
		};
		class RscCombo_2100 : RscCombo 
		{
			idc = 2100;
			x = safeZoneX + safeZoneW * 0.81125;
			y = safeZoneY + safeZoneH * 0.44111112;
			w = safeZoneW * 0.15125;
			h = safeZoneH * 0.03444445;
			colorDisabled[] = {0.2,0.2,0.2,1};
		};
		class RscListbox_1500 : RscListBox 
		{
			idc = 1500;
			x = safeZoneX + safeZoneW * 0.808125;
			y = safeZoneY + safeZoneH * 0.11777778;
			w = safeZoneW * 0.161875;
			h = safeZoneH * 0.19777778;
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorSelectBackground[] = {0.5,0,0,0.5};
			onLBSelChanged = "_this call paint_sliders;";
			
		};
		class RscButton_1601 : RscButton 
		{
			idc = 1601;
			x = safeZoneX + safeZoneW * 0.815;
			y = safeZoneY + safeZoneH * 0.76555556;
			w = safeZoneW * 0.140625;
			h = safeZoneH * 0.03777778;
			text = "Close Shop";
			action = "CloseDialog 0";
			
		};
		class RscButton_1601_copy1 : RscButton 
		{
			idc = 1601;
			x = safeZoneX + safeZoneW * 0.815;
			y = safeZoneY + safeZoneH * 0.71666667;
			w = safeZoneW * 0.140625;
			h = safeZoneH * 0.03777778;
			text = "Buy Texture";
			action = "[]spawn paint_apply";
			
		};
		class RscBackground_2201_copy1 : Rsc_lable 
		{
			idc = 2201;
			x = safeZoneX + safeZoneW * 0.805;
			y = safeZoneY + safeZoneH * 0.03;
			w = safeZoneW * 0.168125;
			h = safeZoneH * 0.03444445;
			text = "Paint Shop";
			
		};
		class RscBackground_2201_copy2 : Rsc_lable 
		{
			idc = 2201;
			x = safeZoneX + safeZoneW * 0.805;
			y = safeZoneY + safeZoneH * 0.49444445;
			w = safeZoneW * 0.168125;
			h = safeZoneH * 0.03444445;
			text = "Change Color";
			
		};
		class RscCombo_2100_copy1 : RscCombo 
		{
			idc = 2100;
			x = safeZoneX + safeZoneW * 0.81125;
			y = safeZoneY + safeZoneH * 0.36777778;
			w = safeZoneW * 0.15125;
			h = safeZoneH * 0.03444445;
			colorDisabled[] = {0.2,0.2,0.2,1};
		};
		
		class RscBackground_Camera : Rsc_lable 
		{
			idc = -1;
			x = safeZoneX + safeZoneW * 0.53;
			y = safeZoneY + safeZoneH * 0.03;
			w = safeZoneW * 0.243125;
			h = safeZoneH * 0.03444445;
			text = "Camera";
			
		};
		
		class Button_ZoomIn : RscButton 
		{
			idc = -1;
			x = safeZoneX + safeZoneW * 0.54;
			y = safeZoneY + safeZoneH * 0.08111112;
			w = safeZoneW * 0.06625;
			h = safeZoneH * 0.02777778;
			text = "Zoom +";
			action = "[1] call paint_Zoom;";
			
		};
		class Button_ZoomOut : RscButton 
		{
			idc = -1;
			x = safeZoneX + safeZoneW * 0.54;
			y = safeZoneY + safeZoneH * 0.13;
			w = safeZoneW * 0.06625;
			h = safeZoneH * 0.02777778;
			text = "Zoom -";
			action = "[2] call paint_Zoom;";
			
		};
		class Button_Front : RscButton 
		{
			idc = -1;
			x = safeZoneX + safeZoneW * 0.615;
			y = safeZoneY + safeZoneH * 0.08111112;
			w = safeZoneW * 0.06625;
			h = safeZoneH * 0.02777778;
			text = "Font";
			action = "[4] call paint_camera;";
			
		};
		class Button_Back : RscButton 
		{
			idc = -1;
			x = safeZoneX + safeZoneW * 0.615;
			y = safeZoneY + safeZoneH * 0.13;
			w = safeZoneW * 0.06625;
			h = safeZoneH * 0.02777778;
			text = "Back";
			action = "[3] call paint_camera;";
			
		};
		class Button_Right : RscButton 
		{
			idc = -1;
			x = safeZoneX + safeZoneW * 0.69;
			y = safeZoneY + safeZoneH * 0.13;
			w = safeZoneW * 0.06625;
			h = safeZoneH * 0.02777778;
			text = "Right";
			action = "[2] call paint_camera;";
			
		};
		class Button_Left : RscButton 
		{
			idc = -1;
			x = safeZoneX + safeZoneW * 0.69;
			y = safeZoneY + safeZoneH * 0.08111112;
			w = safeZoneW * 0.06625;
			h = safeZoneH * 0.02777778;
			text = "Left";
			action = "[1] call paint_camera;";
			
		};
		
	};
	
};
