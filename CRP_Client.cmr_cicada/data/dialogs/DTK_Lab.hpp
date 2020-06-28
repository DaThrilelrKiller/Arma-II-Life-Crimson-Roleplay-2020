class DTK_Lab_Dailog
{
	idd = -1;
	
	class ControlsBackground
	{
		class RscBackground_2203 : Rsc_lable 
		{
			idc = 2203;
			x = safeZoneX + safeZoneW * 0.40625;
			y = safeZoneY + safeZoneH * 0.34777778;
			w = safeZoneW * 0.199375;
			h = safeZoneH * 0.03444445;
			text = "Drug Lab";
			
		};
		class RscBackground_2202 : RscBackground 
		{
			idc = 2202;
			x = safeZoneX + safeZoneW * 0.40625;
			y = safeZoneY + safeZoneH * 0.37777778;
			w = safeZoneW * 0.19875;
			h = safeZoneH * 0.17777778;
			
		};
		
	};
	class Controls
	{
		class Edit_Name : RscEdit
		{
			idc = 87;
			x = safeZoneX + safeZoneW * 0.4325;
			y = safeZoneY + safeZoneH * 0.41222223;
			w = safeZoneW * 0.1375;
			h = safeZoneH * 0.03666667;
			text = "Name";
		};
		class Btn_lace : RscButton
		{
			idc = -1;
			x = safeZoneX + safeZoneW * 0.4325;
			y = safeZoneY + safeZoneH * 0.47555556;
			w = safeZoneW * 0.1375;
			h = safeZoneH * 0.03666667;
			text = "Lace Items";
			action = "DTK_Lab spawn lab_lace";
			
		};
	};
	
};
