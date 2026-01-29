
class atm_menu
{
	idd = 111;
	movingEnable = true;
	objects[] = {};
	class controls
	{	
		class RscBackground_2202: RscBackground
		{
			idc = 2202;

			x = 0.35599 * safezoneW + safezoneX;
			y = 0.194022 * safezoneH + safezoneY;
			w = 0.264018 * safezoneW;
			h = 0.577959 * safezoneH;
		};
		class RscBackground_2203: Rsc_lable
		{
			idc = 2203;

			text = "Bank"; 
			x = 0.35599 * safezoneW + safezoneX;
			y = 0.177023 * safezoneH + safezoneY;
			w = 0.264018 * safezoneW;
			h = 0.0339976 * safezoneH;
		};
		class RscButton_1644: RscButton
		{
			idc = -1;
			action = "['']call atm_send";

			text = "Send Money"; 
			x = 0.387993 * safezoneW + safezoneX;
			y = 0.720984 * safezoneH + safezoneY;
			w = 0.200013 * safezoneW;
			h = 0.0339976 * safezoneH;
		};
		class RscButton_1601: RscButton
		{
			idc = -1;
			action = "call atm_depositeAll";

			text = "Deposit All"; 
			x = 0.387993 * safezoneW + safezoneX;
			y = 0.669988 * safezoneH + safezoneY;
			w = 0.200013 * safezoneW;
			h = 0.0339976 * safezoneH;
		};
		class RscButton_1602: RscButton
		{
			idc = -1;
			action = "call atm_widthdraw";

			text = "Widthdaw"; 
			x = 0.387993 * safezoneW + safezoneX;
			y = 0.567995 * safezoneH + safezoneY;
			w = 0.200013 * safezoneW;
			h = 0.0339976 * safezoneH;
		};
		class RscButton_1603: RscButton
		{
			idc = -1;
			action = "call atm_deposite";

			text = "Deposit"; 
			x = 0.387993 * safezoneW + safezoneX;
			y = 0.618991 * safezoneH + safezoneY;
			w = 0.200013 * safezoneW;
			h = 0.0339976 * safezoneH;
		};
		class RscText_1000: RscBackground
		{
			idc = 1000;

			text = "Bank: 1,000$"; 
			x = 0.387993 * safezoneW + safezoneX;
			y = 0.245018 * safezoneH + safezoneY;
			w = 0.200013 * safezoneW;
			h = 0.0679951 * safezoneH;
		};
		class RscText_1001: RscBackground
		{
			idc = 1001;

			text = "Wallet: 1,000$"; 
			x = 0.387993 * safezoneW + safezoneX;
			y = 0.36401 * safezoneH + safezoneY;
			w = 0.200013 * safezoneW;
			h = 0.0679951 * safezoneH;
		};
		class RscEdit_1400: RSCEdit
		{
			idc = 1400;

			x = 0.387993 * safezoneW + safezoneX;
			y = 0.516999 * safezoneH + safezoneY;
			w = 0.200013 * safezoneW;
			h = 0.0339976 * safezoneH;
		};
		class RscCombo_2100: RscCombo
		{
			idc = 2100;
			x = 0.387993 * safezoneW + safezoneX;
			y = 0.466002 * safezoneH + safezoneY;
			w = 0.200013 * safezoneW;
			h = 0.0339976 * safezoneH;
		};

	};
};
