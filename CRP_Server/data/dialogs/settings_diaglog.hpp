class settings_dialog
{
	idd = -1;
	onUnload = "[]call settings_save;";
	
	class ControlsBackground
	{
		class Background : RscBackground
		{
			x = safeZoneX + safeZoneW * 0.36875;
			y = safeZoneY + safeZoneH * 0.37111112;
			w = safeZoneW * 0.2625;
			h = safeZoneH * 0.30555556;			
		};
		class Heder : Rsc_Lable
		{
			x = safeZoneX + safeZoneW * 0.36875;
			y = safeZoneY + safeZoneH * 0.34666667;
			w = safeZoneW * 0.2625;
			h = safeZoneH * 0.03666667;			
		};
		
	};
	class Controls
	{
		class btn_close : RscButton
		{
			x = safeZoneX + safeZoneW * 0.60375;
			y = safeZoneY + safeZoneH * 0.34666667;
			w = safeZoneW * 0.02625;
			h = safeZoneH * 0.03888889;			
		};
		class text_action : RscText 
		{
			idc = 5;
			x = safeZoneX + safeZoneW * 0.3975;
			y = safeZoneY + safeZoneH * 0.40666667;
			w = safeZoneW * 0.216875;
			h = safeZoneH * 0.03222223;			
		};
		class slider_detail : RscSliderH 
		{
			idc = 1;
			x = safeZoneX + safeZoneW * 0.40125;
			y = safeZoneY + safeZoneH * 0.46777778;
			w = safeZoneW * 0.2075;
			h = safeZoneH * 0.03888889;	
			tooltip = "Terain Detail";
			onSliderPosChanged = "_this call settings_setDetail;";			
		};
		class slider_distance_foot : RscSliderH 
		{
			idc = 2;
			x = safeZoneX + safeZoneW * 0.40125;
			y = safeZoneY + safeZoneH * 0.51666667;
			w = safeZoneW * 0.2075;
			h = safeZoneH * 0.03888889;		
			tooltip = "Foot View Distance";
			onSliderPosChanged = "_this call settings_setDistance;";					
		};
		/*
			class slider_distance_vehicle : RscSliderH 
			{
				idc = 3;
				x = safeZoneX + safeZoneW * 0.40125;
				y = safeZoneY + safeZoneH * 0.56555556;
				w = safeZoneW * 0.2075;
				h = safeZoneH * 0.03888889;	
				tooltip = "Vehicle View Distance";
				onSliderPosChanged = "_this call settings_setDistance;";								
			};
			class slider_distance_air : RscSliderH 
			{
				idc = 4;
				x = safeZoneX + safeZoneW * 0.40125;
				y = safeZoneY + safeZoneH * 0.61444445;
				w = safeZoneW * 0.2075;
				h = safeZoneH * 0.03888889;	
				tooltip = "Air View Distance";
				onSliderPosChanged = "_this call settings_setDistance;";								
			};
		*/
		
	};
	
};
