class medic_respawn
{
	idd = -1;
	onLoad = "[]spawn medical_refresh; _this call display_keypress";
	
	class ControlsBackground
	{
		class RscBackground_2200 : RscBackground 
		{
			idc = 2200;
			x = safeZoneX + safeZoneW * 0.43;
			y = safeZoneY + safeZoneH * 0.38222223;
			w = safeZoneW * 0.161875;
			h = safeZoneH * 0.39;
			
		};
		
	};
	class Controls
	{
		class Button_Respawn : RscButton
		{
			idc = -1;
			x = safeZoneX + safeZoneW * 0.443125;
			y = safeZoneY + safeZoneH * 0.71666667;
			w = safeZoneW * 0.131875;
			h = safeZoneH * 0.04222223;
			text = "Respawn";
			action = "call spawn_openMenu;";
			
		};
		class Button_medic : RscButton
		{
			idc = -1;
			x = safeZoneX + safeZoneW * 0.443125;
			y = safeZoneY + safeZoneH * 0.66777778;
			w = safeZoneW * 0.131875;
			h = safeZoneH * 0.04222223;
			text = "Request Medic";
			action = "[]call medical_request";
			
		};
		class lb_information : RscListBox 
		{
			idc = 897;
			x = safeZoneX + safeZoneW * 0.44;
			y = safeZoneY + safeZoneH * 0.39333334;
			w = safeZoneW * 0.14375;
			h = safeZoneH * 0.26111112;
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorSelectBackground[] = {0.5,0,0,0.5};
			onLBSelChanged = "";
		};
		class lable_shop : Rsc_lable 
		{
			idc = 2201;
			x = safeZoneX + safeZoneW * 0.43;
			y = safeZoneY + safeZoneH * 0.34777778;
			w = safeZoneW * 0.1625;
			h = safeZoneH * 0.03444445;
			text = "";
		};
		class close : RscButton 
		{
			idc = 1602;
			x = safeZoneX + safeZoneW * 0.57375;
			y = safeZoneY + safeZoneH * 0.34666667;
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
			action = "";
			
		};
		
	};
	
};
