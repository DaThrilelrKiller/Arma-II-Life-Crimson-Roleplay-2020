class RscLoadingText;
class RscProgress;
class dtk_loading
{ 
	idd = 20;
	duration = 10e10;
	fadein = 0;
	fadeout = 0;
	name = "loading screen";
	onload = "";

	class controlsBackground
	{
		class blackBG : RscText
		{
			x = safezoneX;
			y = safezoneY;
			w = safezoneW;
			h = safezoneH;
			text = "";
			colorText[] = {0,0,0,0};
			colorBackground[] = {0,0,0,1};
		};
		class nicePic : RscPicture
		{
			x = SafeZoneX;
			y = SafeZoneY;
			h = SafeZoneH;
			w = SafeZoneW;
			text = "data\images\loading.jpg";
		};
	};
	class controls
	{
		class Title1 : RscLoadingText
		{
			text = "Crimson Roleplay"; 
		};
		class Name2: RscText 
		{
			idc = 101;			
			x = safeZoneX + safeZoneW * 0.314375;
			y = safeZoneY + safeZoneH * 0.70888889;
			w = safeZoneW * 0.37125;
			h = safeZoneH * 0.05111112;
			style = 0+2;
			text = "";
			colorText[] = {1,1,1,1};
			sizeEx = 0.08;
			shadow = 2;
		};
	};
};