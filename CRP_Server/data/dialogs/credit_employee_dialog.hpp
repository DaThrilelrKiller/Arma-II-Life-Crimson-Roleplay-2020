class credit_employee_menu
{
	idd = 113;
	movingEnable = true;
	objects[] = {};
	class controls
	{	
		class RscBackground_2202: RscBackground
		{
			idc = 2202;

			x = 0.2 * safezoneW + safezoneX;
			y = 0.1 * safezoneH + safezoneY;
			w = 0.6 * safezoneW;
			h = 0.8 * safezoneH;
		};
		class RscBackground_2203: Rsc_lable
		{
			idc = 2203;

			text = "Cicada Credit Company - Employee Portal"; 
			x = 0.2 * safezoneW + safezoneX;
			y = 0.08 * safezoneH + safezoneY;
			w = 0.6 * safezoneW;
			h = 0.0339976 * safezoneH;
		};
		
		// Status Labels
		class RscText_1000: RscBackground
		{
			idc = 1000;
			text = "Pending Loans: 0"; 
			x = 0.22 * safezoneW + safezoneX;
			y = 0.12 * safezoneH + safezoneY;
			w = 0.14 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class RscText_1001: RscBackground
		{
			idc = 1001;
			text = "Pending Cards: 0"; 
			x = 0.36 * safezoneW + safezoneX;
			y = 0.12 * safezoneH + safezoneY;
			w = 0.14 * safezoneW;
			h = 0.03 * safezoneH;
		};
		
		// Loan Applications Section
		class RscText_LoanLabel: Rsc_lable
		{
			text = "Pending Loan Applications"; 
			x = 0.22 * safezoneW + safezoneX;
			y = 0.15 * safezoneH + safezoneY;
			w = 0.28 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class RscListbox_1500: RscListBox
		{
			idc = 1500;
			x = 0.22 * safezoneW + safezoneX;
			y = 0.18 * safezoneH + safezoneY;
			w = 0.28 * safezoneW;
			h = 0.5 * safezoneH;
		};
		class RscButton_1600: RscButton
		{
			idc = 1600;
			text = "Approve Loan"; 
			action = "call credit_employee_approveLoan;";
			x = 0.22 * safezoneW + safezoneX;
			y = 0.69 * safezoneH + safezoneY;
			w = 0.13 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class RscButton_1601: RscButton
		{
			idc = 1601;
			text = "Reject Loan"; 
			action = "call credit_employee_rejectLoan;";
			x = 0.37 * safezoneW + safezoneX;
			y = 0.69 * safezoneH + safezoneY;
			w = 0.13 * safezoneW;
			h = 0.04 * safezoneH;
		};
		
		// Credit Card Applications Section
		class RscText_CardLabel: Rsc_lable
		{
			text = "Pending Credit Card Applications"; 
			x = 0.52 * safezoneW + safezoneX;
			y = 0.15 * safezoneH + safezoneY;
			w = 0.28 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class RscListbox_1501: RscListBox
		{
			idc = 1501;
			x = 0.52 * safezoneW + safezoneX;
			y = 0.18 * safezoneH + safezoneY;
			w = 0.28 * safezoneW;
			h = 0.5 * safezoneH;
		};
		class RscButton_1602: RscButton
		{
			idc = 1602;
			text = "Approve Card"; 
			action = "call credit_employee_approveCard;";
			x = 0.52 * safezoneW + safezoneX;
			y = 0.69 * safezoneH + safezoneY;
			w = 0.13 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class RscButton_1603: RscButton
		{
			idc = 1603;
			text = "Reject Card"; 
			action = "call credit_employee_rejectCard;";
			x = 0.67 * safezoneW + safezoneX;
			y = 0.69 * safezoneH + safezoneY;
			w = 0.13 * safezoneW;
			h = 0.04 * safezoneH;
		};
		
		// Control Buttons
		class RscButton_1604: RscButton
		{
			idc = 1604;
			text = "Refresh"; 
			action = "call credit_employee_refresh;";
			x = 0.22 * safezoneW + safezoneX;
			y = 0.75 * safezoneH + safezoneY;
			w = 0.18 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class RscButton_1605: RscButton
		{
			idc = 1605;
			text = "Close"; 
			action = "closeDialog 0;";
			x = 0.42 * safezoneW + safezoneX;
			y = 0.75 * safezoneH + safezoneY;
			w = 0.18 * safezoneW;
			h = 0.04 * safezoneH;
		};
	};
};
