class credit_menu
{
	idd = 112;
	movingEnable = true;
	objects[] = {};
	class controls
	{	
		class RscBackground_2202: RscBackground
		{
			idc = 2202;

			x = 0.3 * safezoneW + safezoneX;
			y = 0.15 * safezoneH + safezoneY;
			w = 0.4 * safezoneW;
			h = 0.7 * safezoneH;
		};
		class RscBackground_2203: Rsc_lable
		{
			idc = 2203;

			text = "Credit & Loans"; 
			x = 0.3 * safezoneW + safezoneX;
			y = 0.13 * safezoneH + safezoneY;
			w = 0.4 * safezoneW;
			h = 0.0339976 * safezoneH;
		};
		
		// Display Labels
		class RscText_1000: RscBackground
		{
			idc = 1000;
			text = "Bank: $0"; 
			x = 0.32 * safezoneW + safezoneX;
			y = 0.2 * safezoneH + safezoneY;
			w = 0.18 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class RscText_1001: RscBackground
		{
			idc = 1001;
			text = "Wallet: $0"; 
			x = 0.52 * safezoneW + safezoneX;
			y = 0.2 * safezoneH + safezoneY;
			w = 0.18 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class RscText_1002: RscBackground
		{
			idc = 1002;
			text = "Credit Score: 650"; 
			x = 0.32 * safezoneW + safezoneX;
			y = 0.25 * safezoneH + safezoneY;
			w = 0.36 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class RscText_1003: RscBackground
		{
			idc = 1003;
			text = "Loan Balance: $0"; 
			x = 0.32 * safezoneW + safezoneX;
			y = 0.3 * safezoneH + safezoneY;
			w = 0.36 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class RscText_1004: RscBackground
		{
			idc = 1004;
			text = "Card Balance: $0"; 
			x = 0.32 * safezoneW + safezoneX;
			y = 0.35 * safezoneH + safezoneY;
			w = 0.36 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class RscText_1005: RscBackground
		{
			idc = 1005;
			text = "Max Loan: $0"; 
			x = 0.32 * safezoneW + safezoneX;
			y = 0.4 * safezoneH + safezoneY;
			w = 0.18 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class RscText_1006: RscBackground
		{
			idc = 1006;
			text = "Card Limit: $5,000"; 
			x = 0.52 * safezoneW + safezoneX;
			y = 0.4 * safezoneH + safezoneY;
			w = 0.18 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class RscText_1007: RscBackground
		{
			idc = 1007;
			text = "Loan Interest: 0%"; 
			x = 0.32 * safezoneW + safezoneX;
			y = 0.45 * safezoneH + safezoneY;
			w = 0.18 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class RscText_1008: RscBackground
		{
			idc = 1008;
			text = "Card Interest: 0%"; 
			x = 0.52 * safezoneW + safezoneX;
			y = 0.45 * safezoneH + safezoneY;
			w = 0.18 * safezoneW;
			h = 0.04 * safezoneH;
		};
		
		// Loan Section
		class RscText_LoanLabel: Rsc_lable
		{
			text = "Loan Application"; 
			x = 0.32 * safezoneW + safezoneX;
			y = 0.52 * safezoneH + safezoneY;
			w = 0.18 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class RscEdit_1400: RSCEdit
		{
			idc = 1400;
			text = "0";
			x = 0.32 * safezoneW + safezoneX;
			y = 0.56 * safezoneH + safezoneY;
			w = 0.18 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class RscButton_1600: RscButton
		{
			idc = 1600;
			text = "Apply for Loan"; 
			action = "call credit_applyLoan;";
			x = 0.32 * safezoneW + safezoneX;
			y = 0.6 * safezoneH + safezoneY;
			w = 0.18 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class RscButton_1601: RscButton
		{
			idc = 1601;
			text = "Pay Loan"; 
			action = "call credit_payLoan;";
			x = 0.32 * safezoneW + safezoneX;
			y = 0.65 * safezoneH + safezoneY;
			w = 0.18 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class RscEdit_1401: RSCEdit
		{
			idc = 1401;
			text = "0";
			x = 0.32 * safezoneW + safezoneX;
			y = 0.69 * safezoneH + safezoneY;
			w = 0.18 * safezoneW;
			h = 0.03 * safezoneH;
		};
		
		// Credit Card Section
		class RscText_CardLabel: Rsc_lable
		{
			text = "Credit Card"; 
			x = 0.52 * safezoneW + safezoneX;
			y = 0.52 * safezoneH + safezoneY;
			w = 0.18 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class RscButton_1602: RscButton
		{
			idc = 1602;
			text = "Apply for Card"; 
			action = "call credit_applyCard;";
			x = 0.52 * safezoneW + safezoneX;
			y = 0.56 * safezoneH + safezoneY;
			w = 0.18 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class RscButton_1603: RscButton
		{
			idc = 1603;
			text = "Pay Card"; 
			action = "call credit_payCard;";
			x = 0.52 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.18 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class RscEdit_1402: RSCEdit
		{
			idc = 1402;
			text = "0";
			x = 0.52 * safezoneW + safezoneX;
			y = 0.66 * safezoneH + safezoneY;
			w = 0.18 * safezoneW;
			h = 0.03 * safezoneH;
		};
		
		// Close Button
		class RscButton_1604: RscButton
		{
			idc = 1604;
			text = "Close"; 
			action = "closeDialog 0;";
			x = 0.32 * safezoneW + safezoneX;
			y = 0.75 * safezoneH + safezoneY;
			w = 0.36 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class RscButton_1605: RscButton
		{
			idc = 1605;
			text = "Refresh"; 
			action = "call credit_refresh;";
			x = 0.32 * safezoneW + safezoneX;
			y = 0.8 * safezoneH + safezoneY;
			w = 0.36 * safezoneW;
			h = 0.04 * safezoneH;
		};
	};
};
