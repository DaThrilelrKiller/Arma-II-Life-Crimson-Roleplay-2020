class chat_emjio
{
	idd = 26;
	class ControlsBackground{};
	class Controls
	{
		class Control1571402637 : RscListBox
		{
			idc=12;
			x = safeZoneX + safeZoneW * 0.431875;
			y = safeZoneY + safeZoneH * 0.68111112;
			w = safeZoneW * 0.13125;
			h = safeZoneH * 0.25444445;
			onLBSelChanged = "_this call chat_add";
		};
		class header : Rsc_lable
		{
			idc = -1;
			x = safeZoneX + safeZoneW * 0.431875;
			y = safeZoneY + safeZoneH * 0.65111112;
			w = safeZoneW * 0.131875;
			h = safeZoneH * 0.03;
			style = 0+2;
			text = "Emoji";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
		};
		
	};
	
};
