class ar_plate
{
	idd = 8943;
	movingEnable = false;
	duration = 10;
	fadein = 0;
	name = "ar_plate";
	fadeout = 0;
	onLoad = "uiNamespace setVariable ['ar_plate', _this select 0]";
	controlsBackground[] = {};
	objects[] = {};

	class Controls
	{
		class RscPicture_1200 : RscPicture 
		{
			idc = -1;
			x = safeZoneX + safeZoneW * 0.23625;
			y = safeZoneY + safeZoneH * 0.15666667;
			w = safeZoneW * 0.130625;
			h = safeZoneH * 0.13777778;
			text = "data\images\plates\_plate.paa";
			
		};
		class Control1587434356
		{
			type = 0;
			idc = 20;
			x = safeZoneX + safeZoneW * 0.226875;
			y = safeZoneY + safeZoneH * 0.17;
			w = safeZoneW * 0.143125;
			h = safeZoneH * 0.10555556;
			style = 0+2+192;
			text = "DtK-5973";
			colorBackground[] = {0,0,0,0};
			colorText[] = {0,0,0,1};
			font = "Zeppelin33";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 2.15);
			lineSpacing = 0;
			
		};
	};
};
