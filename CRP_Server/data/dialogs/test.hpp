class test
{
	idd = 789;
	class ControlsBackground{};
	
	class Controls
	{
		class speed_background : RscBackground
		{
			idc = 101;
			x = safeZoneX + safeZoneW * 0.420625;
			y = safeZoneY + safeZoneH * 0.22555556;
			w = safeZoneW * 0.194375;
			h = safeZoneH * 0.09777778;
		};
		class speed_slider : RscSliderH
		{
			idc = 102;
			x = safeZoneX + safeZoneW * 0.436875;
			y = safeZoneY + safeZoneH * 0.27111112;
			w = safeZoneW * 0.1625;
			h = safeZoneH * 0.03111112;	
						
		};
		class Speed_text : RscText
		{
			idc = 103;
			x = safeZoneX + safeZoneW * 0.45875;
			y = safeZoneY + safeZoneH * 0.23333334;
			w = safeZoneW * 0.125;
			h = safeZoneH * 0.03555556;		
						
		};
		class trunk_background : RscBackground
		{
			idc = 201;
			x = safeZoneX + safeZoneW * 0.420625;
			y = safeZoneY + safeZoneH * 0.27444445;
			w = safeZoneW * 0.194375;
			h = safeZoneH * 0.09777778;		
						
		};
		class trunk_slider : RscSliderH
		{
			idc = 202;
			x = safeZoneX + safeZoneW * 0.436875;
			y = safeZoneY + safeZoneH * 0.32;
			w = safeZoneW * 0.1625;
			h = safeZoneH * 0.03111112;		
						
		};
		class trunk_text : RscText
		{
			idc = 203;
			x = safeZoneX + safeZoneW * 0.45875;
			y = safeZoneY + safeZoneH * 0.30666667;
			w = safeZoneW * 0.145;
			h = safeZoneH * 0.03555556;		
						
		};
		class plate_background : RscBackground
		{
			idc = 301;
			x = safeZoneX + safeZoneW * 0.420625;
			y = safeZoneY + safeZoneH * 0.32333334;
			w = safeZoneW * 0.194375;
			h = safeZoneH * 0.09777778;					
		};
		class plate_edit : RscEdit
		{
			idc = 302;
			x = safeZoneX + safeZoneW * 0.448125;
			y = safeZoneY + safeZoneH * 0.35;
			w = safeZoneW * 0.1325;
			h = safeZoneH * 0.03777778;				
		};
		class glow_background : RscBackground
		{
			idc = 401;
			x = safeZoneX + safeZoneW * 0.420625;
			y = safeZoneY + safeZoneH * 0.37222223;
			w = safeZoneW * 0.194375;
			h = safeZoneH * 0.09777778;	
						
		};
		class glow_slider : RscSliderH
		{
			idc = 402;
			x = safeZoneX + safeZoneW * 0.435625;
			y = safeZoneY + safeZoneH * 0.40444445;
			w = safeZoneW * 0.1625;
			h = safeZoneH * 0.03111112;	
						
		};
		class speed_button : RscButton 
		{
			idc = 100;
			x = safeZoneX + safeZoneW * 0.4175;
			y = safeZoneY + safeZoneH * 0.17666667;
			w = safeZoneW * 0.19875;
			h = safeZoneH * 0.04888889;	
			text="Speed";			
		};
		class Trunk_button : RscButton 
		{
			idc = 200;
			x = safeZoneX + safeZoneW * 0.4175;
			y = safeZoneY + safeZoneH * 0.22555556;
			w = safeZoneW * 0.19875;
			h = safeZoneH * 0.04888889;		
			text="Storage";
		};
		class plate_button : RscButton 
		{
			idc = 300;
			x = safeZoneX + safeZoneW * 0.4175;
			y = safeZoneY + safeZoneH * 0.27444445;
			w = safeZoneW * 0.19875;
			h = safeZoneH * 0.04888889;	
			text="Licence Plate";
		};
		class glow_buton : RscButton 
		{
			idc = 400;
			x = safeZoneX + safeZoneW * 0.4175;
			y = safeZoneY + safeZoneH * 0.32333334;
			w = safeZoneW * 0.19875;
			h = safeZoneH * 0.04888889;	
			text="Underglow";			
		};
		class repair_button : RscButton 
		{
			idc = 500;
			x = safeZoneX + safeZoneW * 0.4175;
			y = safeZoneY + safeZoneH * 0.37222223;
			w = safeZoneW * 0.19875;
			h = safeZoneH * 0.04888889;		
			text="Repair";
		};
		
	};
	
};
