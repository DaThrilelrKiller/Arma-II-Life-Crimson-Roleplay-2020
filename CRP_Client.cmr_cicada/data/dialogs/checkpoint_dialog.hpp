class AM_CheckpointBuilder {
	idd=-1;
	CONTROLS[]={RscFrame_1800,RscListbox_1500,RscShortcutButton_1700,RscShortcutButton_1701,RscText_1000};
	class RscFrame_1800: RscBackground
	{
		idc = 1800;
		x = 0.295312 * safezoneW + safezoneX;
		y = 0.339815 * safezoneH + safezoneY;
		w = 0.40948 * safezoneW;
		h = 0.38 * safezoneH;
	};
	class RscListbox_1500: RscListBox
	{
		idc = 1500;
		x = 0.308333 * safezoneW + safezoneX;
		y = 0.394444 * safezoneH + safezoneY;
		w = 0.383437 * safezoneW;
		h = 0.240185 * safezoneH;
	};
	class RscShortcutButton_1700: RscButton
	{
		idc = 1700;
		text = "Purchase";
		x = 0.305729 * safezoneW + safezoneX;
		y = 0.65 * safezoneH + safezoneY;
		w = 0.0954165 * safezoneW;
		h = 0.0605555 * safezoneH;
		action="[lbCursel 1500] call Checkpoint_Purchase";
	};
	class RscShortcutButton_1701: RscButton
	{
		idc = 1701;
		text = "Clear Checkpoint";
		x = 0.60052 * safezoneW + safezoneX;
		y = 0.653704 * safezoneH + safezoneY;
		w = 0.0954165 * safezoneW;
		h = 0.0605555 * safezoneH;
		action="[] call Checkpoint_Clear";
	};
	class RscText_1000: RscText
	{
		idc = 1000;
		text = "Checkpoint Builder";
		x = 0.454883 * safezoneW + safezoneX;
		y = 0.34875 * safezoneH + safezoneY;
		w = 0.154687 * safezoneW;
		h = 0.04125 * safezoneH;
	};
};