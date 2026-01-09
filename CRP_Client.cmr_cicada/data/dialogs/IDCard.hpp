
class IDCard
{
	idd = -1;
	fadeout=1;
	fadein=1;
	duration = 7;
	name= "IDCard";
	onLoad = "uiNamespace setVariable ['IDCard', _this select 0]";
	objects[] = {};
	controls[] = {};
	
	class ControlsBackground
	{
		class Background : RscPicture 
		{
			idc = 1201;
			x = safeZoneX + safeZoneW * 0.055;
			y = safeZoneY + safeZoneH * 0.06;
			w = safeZoneW * 0.3125;
			h = safeZoneH * 0.40888889;
			text = "data\images\id\id.paa";
			
		};
		class Text_Name : RscText 
		{
			idc = 1400;
			x = safeZoneX + safeZoneW * 0.22;
			y = safeZoneY + safeZoneH * 0.16666667;
			w = safeZoneW * 0.1375;
			h = safeZoneH * 0.02444445;
			text = "Tucker";
			colorText[] = {0,0,0,1};
			sizeEx = 0.055;
			
		};
		class Text_IDnum : RscText 
		{
			idc = 1402;
			x = safeZoneX + safeZoneW * 0.220625;
			y = safeZoneY + safeZoneH * 0.22555556;
			w = safeZoneW * 0.1375;
			h = safeZoneH * 0.02444445;
			text = "7884268874267995";
			colorText[] = {0,0,0,1};
			sizeEx = 0.055;
			
		};
		class Text_Rank : RscText 
		{
			idc = 1403;
			x = safeZoneX + safeZoneW * 0.22125;
			y = safeZoneY + safeZoneH * 0.25555556;
			w = safeZoneW * 0.1375;
			h = safeZoneH * 0.02333334;
			text = "Member";
			colorText[] = {0,0,0,1};
			sizeEx = 0.055;
			
		};
		class Text_DOB : RscText 
		{
			idc = 1401;
			x = safeZoneX + safeZoneW * 0.220625;
			y = safeZoneY + safeZoneH * 0.19555556;
			w = safeZoneW * 0.1375;
			h = safeZoneH * 0.02444445;
			text = "September 3 1999";
			colorText[] = {0,0,0,1};
			sizeEx = 0.055;
			
		};
		class face : RscPicture 
		{
			idc = 1404;
			x = safeZoneX + safeZoneW * 0.069375;
			y = safeZoneY + safeZoneH * 0.17111112;
			w = safeZoneW * 0.09;
			h = safeZoneH * 0.17333334;
			text = "";
			
		};
	};
};
