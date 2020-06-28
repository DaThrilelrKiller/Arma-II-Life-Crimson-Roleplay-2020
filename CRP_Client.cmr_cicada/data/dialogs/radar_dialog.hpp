class radar_dialog
{
	idd = 63;
	duration = 99999999999999999;
	fadein = 0;
	name = "radar_dialog";
	fadeout = 0;
	onLoad = "uiNamespace setVariable ['radar_dialog', _this select 0]";
	
	class ControlsBackground
	{
		class background : RscPicture
		{
			x = safeZoneX + safeZoneW * 0.443125;
			y = safeZoneY + safeZoneH * 0.42;
			w = safeZoneW * 0.21625;
			h = safeZoneH * 0.13888889;
			text = "\crp_data\images\radar\radar.paa";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
		};
		
	};
	class Controls
	{
		class red_1 : RscPicture
		{
			idc = 1;
			x = safeZoneX + safeZoneW * 0.458125;
			y = safeZoneY + safeZoneH * 0.44111112;
			w = safeZoneW * 0.0225;
			h = safeZoneH * 0.03777778;
			text = "\crp_data\images\radar\0.pac";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class red_2 : RscPicture
		{
			idc = 2;
			x = safeZoneX + safeZoneW * 0.4775;
			y = safeZoneY + safeZoneH * 0.44222223;
			w = safeZoneW * 0.0225;
			h = safeZoneH * 0.03777778;
			text = "\crp_data\images\radar\0.pac";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class red_3 : RscPicture
		{
			idc = 3;
			x = safeZoneX + safeZoneW * 0.496875;
			y = safeZoneY + safeZoneH * 0.44222223;
			w = safeZoneW * 0.0225;
			h = safeZoneH * 0.03777778;
			text = "\crp_data\images\radar\0.pac";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class orange_1 : RscPicture
		{
			idc = 4;
			x = safeZoneX + safeZoneW * 0.520625;
			y = safeZoneY + safeZoneH * 0.44111112;
			w = safeZoneW * 0.0225;
			h = safeZoneH * 0.03777778;
			text = "\crp_data\images\radar\0.pac";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class orange_2 : RscPicture
		{
			idc = 5;
			x = safeZoneX + safeZoneW * 0.540625;
			y = safeZoneY + safeZoneH * 0.44111112;
			w = safeZoneW * 0.0225;
			h = safeZoneH * 0.03777778;
			text = "\crp_data\images\radar\0.pac";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class orange_3 : RscPicture
		{
			idc = 6;
			x = safeZoneX + safeZoneW * 0.56;
			y = safeZoneY + safeZoneH * 0.44222223;
			w = safeZoneW * 0.0225;
			h = safeZoneH * 0.03777778;
			text = "\crp_data\images\radar\0.pac";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class green_1 : RscPicture
		{
			idc = 7;
			x = safeZoneX + safeZoneW * 0.585;
			y = safeZoneY + safeZoneH * 0.44333334;
			w = safeZoneW * 0.0225;
			h = safeZoneH * 0.03777778;
			text = "\crp_data\images\radar\0.pac";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class green_2 : RscPicture
		{
			idc = 8;
			x = safeZoneX + safeZoneW * 0.605;
			y = safeZoneY + safeZoneH * 0.44222223;
			w = safeZoneW * 0.0225;
			h = safeZoneH * 0.03777778;
			text = "\crp_data\images\radar\0.pac";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class green_3 : RscPicture
		{
			idc = 9;
			x = safeZoneX + safeZoneW * 0.624375;
			y = safeZoneY + safeZoneH * 0.44222223;
			w = safeZoneW * 0.0225;
			h = safeZoneH * 0.03777778;
			text = "\crp_data\images\radar\0.pac";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		
	};
	
};
