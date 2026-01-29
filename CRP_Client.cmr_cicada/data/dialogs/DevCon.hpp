class DevCon
{
	idd = -1;
	class ControlsBackground
	{
		class RscBackground_2203 : Rsc_lable 
		{
			idc = 2203;
			x = safeZoneX + safeZoneW * 0.03125;
			y = safeZoneY + safeZoneH * 0.17666667;
			w = safeZoneW * 0.3825;
			h = safeZoneH * 0.03444445;
			text = "DevCon";
			
		};
		class RscBackground_2202 : RscBackground 
		{
			idc = 2202;
			x = safeZoneX + safeZoneW * 0.03125;
			y = safeZoneY + safeZoneH * 0.21111112;
			w = safeZoneW * 0.381875;
			h = safeZoneH * 0.56111112;
			
		};
		
	};
	class Controls
	{
		class RscLablePrev : RscText
		{
			idc = 89;
			x = safeZoneX + safeZoneW * 0.069375;
			y = safeZoneY + safeZoneH * 0.71222223;
			w = safeZoneW * 0.0875;
			h = safeZoneH * 0.04111112;
			text = "Live Preview";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class RscCombo_Config : RscCombo 
		{
			idc = 2100;
			x = safeZoneX + safeZoneW * 0.045625;
			y = safeZoneY + safeZoneH * 0.22777778;
			w = safeZoneW * 0.13625;
			h = safeZoneH * 0.03444445;
			onLBSelChanged =  "[]call DEV_RefreshKind";
		};
		class RscListbox_Class : RscListBox 
		{
			idc = 1501;
			x = safeZoneX + safeZoneW * 0.046875;
			y = safeZoneY + safeZoneH * 0.32555556;
			w = safeZoneW * 0.13375;
			h = safeZoneH * 0.38;
			onLBSelChanged =  "[]call DEV_RefreshActions";
		};
		class RscListbox_Action : RscListBox 
		{
			idc = 1502;
			x = safeZoneX + safeZoneW * 0.190625;
			y = safeZoneY + safeZoneH * 0.27666667;
			w = safeZoneW * 0.205;
			h = safeZoneH * 0.47888889;
			onLBSelChanged =  "[]call DEV_ExecAction";

		};
		class RscButton_Preview : RscButton 
		{
			idc = 1602;
			x = safeZoneX + safeZoneW * 0.049375;
			y = safeZoneY + safeZoneH * 0.72111112;
			w = safeZoneW * 0.01625;
			h = safeZoneH * 0.02555556;
			text = "X";
			action = "";
			
		};
		class RscCombo_Client : RscCombo 
		{
			idc = 2102;
			x = safeZoneX + safeZoneW * 0.19125;
			y = safeZoneY + safeZoneH * 0.22777778;
			w = safeZoneW * 0.20625;
			h = safeZoneH * 0.03444445;
		};
		class RscCombo_ConfigKind : RscCombo 
		{
			idc = 2101;
			x = safeZoneX + safeZoneW * 0.045625;
			y = safeZoneY + safeZoneH * 0.27666667;
			w = safeZoneW * 0.13625;
			h = safeZoneH * 0.03444445;
			onLBSelChanged =  "[]spawn DEV_RefreshConfig";
		};
		
	};
	
};
