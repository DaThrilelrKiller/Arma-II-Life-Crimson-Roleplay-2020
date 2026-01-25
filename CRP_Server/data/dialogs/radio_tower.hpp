class radio_tower
{
	idd = -1;
	
	class ControlsBackground{};
	class Controls
	{
		class Control1881479199 : RscButton
		{
			type = 1;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.41875;
			y = safeZoneY + safeZoneH * 0.70222223;
			w = safeZoneW * 0.178125;
			h = safeZoneH * 0.03666667;
			text = "Listen To Frequency";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			action = "";
			
		};
		class RscBackground_2202 : RscBackground 
		{
			idc = 2202;
			x = safeZoneX + safeZoneW * 0.40625;
			y = safeZoneY + safeZoneH * 0.23;
			w = safeZoneW * 0.19875;
			h = safeZoneH * 0.52;
			
		};
		class Control1613797786 : RscListBox 
		{
			type = 5;
			idc = 56;
			x = safeZoneX + safeZoneW * 0.4175;
			y = safeZoneY + safeZoneH * 0.25;
			w = safeZoneW * 0.1775;
			h = safeZoneH * 0.44;
			style = 16;
			colorDisabled[] = {0.2,0.2,0.2,1};
			maxHistoryDelay = 0;
			rowHeight = 0;
			sizeEx = (((((safezoneW/safezoneH)min1.2)/1.2)/25)*1);
			onLBSelChanged = "call {}";
		};
		class dummybutton : RscDummy 
		{
			idc = 2;
			
		};
		class RscBackground_2203 : Rsc_lable 
		{
			idc = 2203;
			x = safeZoneX + safeZoneW * 0.405625;
			y = safeZoneY + safeZoneH * 0.2;
			w = safeZoneW * 0.199375;
			h = safeZoneH * 0.03444445;
			text = "Radio Tower";
			
		};
		
	};
	
};
