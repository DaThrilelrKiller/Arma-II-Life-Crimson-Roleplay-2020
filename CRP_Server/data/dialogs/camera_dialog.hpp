class camera_dialog
{
	idd = 158;
	class ControlsBackground
	{
		class Background
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.39375;
			y = safeZoneY + safeZoneH * 0.22444445;
			w = safeZoneW * 0.2125;
			h = safeZoneH * 0.55;
			style = 0;
			text = "";
			colorBackground[] = {0,0,0,1};
			colorText[] = {0.1176,0.3843,0.8275,1};
			font = "Zeppelin32";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class title
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.39375;
			y = safeZoneY + safeZoneH * 0.2;
			w = safeZoneW * 0.2125;
			h = safeZoneH * 0.03666667;
			style = 0;
			text = "CCTV";
			colorBackground[] = {0.6,0,0,1};
			colorText[] = {1,1,1,1};
			font = "Zeppelin32";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		
	};
	class Controls
	{
		class Control777518547 : RscButton
		{
			type = 1;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.41875;
			y = safeZoneY + safeZoneH * 0.66444445;
			w = safeZoneW * 0.1625;
			h = safeZoneH * 0.03666667;
			style = 0+2;
			text = "View Camera";
			borderSize = 1;
			colorBackground[] = {0.6,0,0,1};
			colorBackgroundActive[] = {1,0,0,1};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
			colorBorder[] = {0,0,0,0};
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
			action = "call camera_view";
			
		};
		class Control777518547_copy1 : RscButton
		{
			type = 1;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.41875;
			y = safeZoneY + safeZoneH * 0.71333334;
			w = safeZoneW * 0.1625;
			h = safeZoneH * 0.03666667;
			style = 0+2;
			text = "Exit";
			borderSize = 1;
			colorBackground[] = {0.6,0,0,1};
			colorBackgroundActive[] = {1,0,0,1};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
			colorBorder[] = {0,0,0,0};
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
			action = "closeDialog 0";
			
		};
		class Control579721111 : RscListBox
		{
			type = 5;
			idc = 16;
			x = safeZoneX + safeZoneW * 0.41875;
			y = safeZoneY + safeZoneH * 0.24888889;
			w = safeZoneW * 0.1625;
			h = safeZoneH * 0.39777778;
			style = 16;
			colorBackground[] = {0,0,0,1};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorSelect[] = {0.6,0,0,1};
			colorText[] = {1,1,1,1};
			font = "Zeppelin32";
			maxHistoryDelay = 0;
			rowHeight = 0;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			class ScrollBar {
				arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
				arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
				border = "\ca\ui\data\ui_border_scroll_ca.paa";
				thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
			};
		};
	};
	
};
