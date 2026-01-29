class jail_menu
{
	idd = -1;
	
	class ControlsBackground
	{
		class Background : RscBackground
		{
			x = safeZoneX + safeZoneW * 0.36875;
			y = safeZoneY + safeZoneH * 0.37111112;
			w = safeZoneW * 0.2625;
			h = safeZoneH * 0.23222223;			
		};
		class Heder : Rsc_lable
		{
			x = safeZoneX + safeZoneW * 0.36875;
			y = safeZoneY + safeZoneH * 0.34666667;
			w = safeZoneW * 0.2625;
			h = safeZoneH * 0.03666667;			
		};
		
	};
	class Controls
	{
		class btn_arrest : RscButton
		{
			x = safeZoneX + safeZoneW * 0.448125;
			y = safeZoneY + safeZoneH * 0.53333334;
			w = safeZoneW * 0.0925;
			h = safeZoneH * 0.03888889;		
			text="Arrest";
			action="[]call Jail_Jail";
		};
		class btn_close : RscButton
		{
			x = safeZoneX + safeZoneW * 0.60375;
			y = safeZoneY + safeZoneH * 0.34666667;
			w = safeZoneW * 0.02625;
			h = safeZoneH * 0.03888889;	
			action="closeDialog 0";
		};
		class text_time : RscText 
		{
			idc=10;
			x = safeZoneX + safeZoneW * 0.4475;
			y = safeZoneY + safeZoneH * 0.40666667;
			w = safeZoneW * 0.116875;
			h = safeZoneH * 0.03222223;			
		};
		class slider_time : RscSliderH 
		{
			idc=11;
			x = safeZoneX + safeZoneW * 0.40125;
			y = safeZoneY + safeZoneH * 0.46777778;
			w = safeZoneW * 0.199375;
			h = safeZoneH * 0.03888889;			
			onSliderPosChanged = "_this call jail_setTime";
		};
		
	};
	
};
