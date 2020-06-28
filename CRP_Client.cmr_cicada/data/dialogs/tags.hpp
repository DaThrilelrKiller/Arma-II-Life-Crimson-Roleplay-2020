class tag {

	idd = 1000600;
	movingEnable=0;
	duration = 10^1000;
	onLoad = "uiNamespace setVariable ['tag',_this select 0]";
	
	class controlsBackground
	{
		class tag1 {
			
			idc = 54;
			type = 13;
			style = 0x01;
			x = 0.5;
			y = 0.5;
			w = 0.25;
			h = 0.4;
			size = 0.02;
			colorBackground[] = {0,0,0,0};
			colortext[] = {0,0,0,1};
			text ="";
			shadow = 2;
			
			class Attributes {
				align = "right";
				valign = "middle";
				size = "2";
			};
		};
	};
};

class tag_notify {

	idd = 1010;
	movingEnable=0;
	duration = 8;
	fadein = 0.5;
	fadeout = 5;
	onLoad = "uiNamespace setVariable ['tag_notify',_this select 0]";
	
	class controlsBackground
	{
		class tag1 {
			
			idc = 54;
			type = 13;
			style = 0x01;
			x = safeZoneX + safeZoneW * 0.71875;
			y = safeZoneY + safeZoneH * 0.70333334;
			w = safeZoneW * 0.2075;
			h = safeZoneH * 0.19333334;
			size = 0.02;
			colorBackground[] = {0,0,0,0};
			colortext[] = {0,0,0,0.7};
			text ="";
			shadow = 2;
			
			class Attributes {
				align = "right";
				valign = "middle";
				size = "2";
			};
		};
	};
};

class tag_notify_nodelay {

	idd = 1010;
	movingEnable=0;
	duration = 5;
	fadein = 0;
	fadeout = 0;
	onLoad = "uiNamespace setVariable ['tag_notify',_this select 0]";
	
	class controlsBackground
	{
		class tag1 {
			
			idc = 54;
			type = 13;
			style = 0x01;
			x = safeZoneX + safeZoneW * 0.71875;
			y = safeZoneY + safeZoneH * 0.70333334;
			w = safeZoneW * 0.2075;
			h = safeZoneH * 0.19333334;
			size = 0.02;
			colorBackground[] = {0,0,0,0};
			colortext[] = {0,0,0,0.7};
			text ="";
			shadow = 2;
			
			class Attributes {
				align = "right";
				valign = "middle";
				size = "2";
			};
		};
	};
};