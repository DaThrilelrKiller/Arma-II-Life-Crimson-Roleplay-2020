class court_fileCase
{
	idd = -1;
	
	class ControlsBackground
	{
		class Background : RscBackground
		{
			x = safeZoneX + safeZoneW * 0.3;
			y = safeZoneY + safeZoneH * 0.25;
			w = safeZoneW * 0.4;
			h = safeZoneH * 0.5;
		};
		class Header : Rsc_lable
		{
			x = safeZoneX + safeZoneW * 0.3;
			y = safeZoneY + safeZoneH * 0.25;
			w = safeZoneW * 0.4;
			h = safeZoneH * 0.05;
			text = "Cicada Municipal Court - File Case";
		};
	};
	
	class Controls
	{
		class lbl_defendant : RscText
		{
			idc = 1000;
			x = safeZoneX + safeZoneW * 0.32;
			y = safeZoneY + safeZoneH * 0.32;
			w = safeZoneW * 0.15;
			h = safeZoneH * 0.04;
			text = "Defendant Name:";
		};
		class edit_defendant : RscEdit
		{
			idc = 1001;
			x = safeZoneX + safeZoneW * 0.32;
			y = safeZoneY + safeZoneH * 0.36;
			w = safeZoneW * 0.35;
			h = safeZoneH * 0.04;
			text = "";
		};
		class lbl_charges : RscText
		{
			idc = 1002;
			x = safeZoneX + safeZoneW * 0.32;
			y = safeZoneY + safeZoneH * 0.42;
			w = safeZoneW * 0.15;
			h = safeZoneH * 0.04;
			text = "Charges:";
		};
		class edit_charges : RscEdit
		{
			idc = 1003;
			x = safeZoneX + safeZoneW * 0.32;
			y = safeZoneY + safeZoneH * 0.46;
			w = safeZoneW * 0.35;
			h = safeZoneH * 0.04;
			text = "";
		};
		class lbl_description : RscText
		{
			idc = 1004;
			x = safeZoneX + safeZoneW * 0.32;
			y = safeZoneY + safeZoneH * 0.52;
			w = safeZoneW * 0.15;
			h = safeZoneH * 0.04;
			text = "Description:";
		};
		class edit_description : RscEdit
		{
			idc = 1005;
			x = safeZoneX + safeZoneW * 0.32;
			y = safeZoneY + safeZoneH * 0.56;
			w = safeZoneW * 0.35;
			h = safeZoneH * 0.12;
			text = "";
			style = ST_MULTI;
		};
		class btn_submit : RscButton
		{
			x = safeZoneX + safeZoneW * 0.42;
			y = safeZoneY + safeZoneH * 0.7;
			w = safeZoneW * 0.1;
			h = safeZoneH * 0.04;
			text = "File Case";
			action = "[] call court_submitCase";
		};
		class btn_close : RscButton
		{
			x = safeZoneX + safeZoneW * 0.68;
			y = safeZoneY + safeZoneH * 0.25;
			w = safeZoneW * 0.02;
			h = safeZoneH * 0.04;
			text = "X";
			action = "closeDialog 0;";
		};
	};
};

class court_caseList
{
	idd = -1;
	
	class ControlsBackground
	{
		class Background : RscBackground
		{
			x = safeZoneX + safeZoneW * 0.2;
			y = safeZoneY + safeZoneH * 0.15;
			w = safeZoneW * 0.6;
			h = safeZoneH * 0.7;
		};
		class Header : Rsc_lable
		{
			x = safeZoneX + safeZoneW * 0.2;
			y = safeZoneY + safeZoneH * 0.15;
			w = safeZoneW * 0.6;
			h = safeZoneH * 0.05;
			text = "Cicada Municipal Court - Case List";
		};
	};
	
	class Controls
	{
		class list_cases : RscListBox
		{
			idc = 2001;
			x = safeZoneX + safeZoneW * 0.22;
			y = safeZoneY + safeZoneH * 0.22;
			w = safeZoneW * 0.25;
			h = safeZoneH * 0.5;
			onLBSelChanged = "[] call court_selectCase";
		};
		class txt_caseID : RscText
		{
			idc = 2002;
			x = safeZoneX + safeZoneW * 0.5;
			y = safeZoneY + safeZoneH * 0.22;
			w = safeZoneW * 0.28;
			h = safeZoneH * 0.04;
			text = "Case #";
		};
		class txt_plaintiff : RscText
		{
			idc = 2003;
			x = safeZoneX + safeZoneW * 0.5;
			y = safeZoneY + safeZoneH * 0.28;
			w = safeZoneW * 0.28;
			h = safeZoneH * 0.04;
			text = "Plaintiff:";
		};
		class txt_defendant : RscText
		{
			idc = 2004;
			x = safeZoneX + safeZoneW * 0.5;
			y = safeZoneY + safeZoneH * 0.34;
			w = safeZoneW * 0.28;
			h = safeZoneH * 0.04;
			text = "Defendant:";
		};
		class txt_charges : RscText
		{
			idc = 2005;
			x = safeZoneX + safeZoneW * 0.5;
			y = safeZoneY + safeZoneH * 0.4;
			w = safeZoneW * 0.28;
			h = safeZoneH * 0.04;
			text = "Charges:";
		};
		class txt_status : RscText
		{
			idc = 2006;
			x = safeZoneX + safeZoneW * 0.5;
			y = safeZoneY + safeZoneH * 0.46;
			w = safeZoneW * 0.28;
			h = safeZoneH * 0.04;
			text = "Status:";
		};
		class txt_description : RscText
		{
			idc = 2007;
			x = safeZoneX + safeZoneW * 0.5;
			y = safeZoneY + safeZoneH * 0.52;
			w = safeZoneW * 0.28;
			h = safeZoneH * 0.2;
			text = "Description:";
			style = ST_MULTI;
		};
		class btn_startHearing : RscButton
		{
			x = safeZoneX + safeZoneW * 0.5;
			y = safeZoneY + safeZoneH * 0.75;
			w = safeZoneW * 0.12;
			h = safeZoneH * 0.04;
			text = "Start Hearing";
			action = "[] call court_startHearing";
		};
		class btn_close : RscButton
		{
			x = safeZoneX + safeZoneW * 0.78;
			y = safeZoneY + safeZoneH * 0.15;
			w = safeZoneW * 0.02;
			h = safeZoneH * 0.04;
			text = "X";
			action = "closeDialog 0;";
		};
	};
	
	onLoad = "[] call court_loadCases;";
};

class court_hearing
{
	idd = -1;
	
	class ControlsBackground
	{
		class Background : RscBackground
		{
			x = safeZoneX + safeZoneW * 0.25;
			y = safeZoneY + safeZoneH * 0.2;
			w = safeZoneW * 0.5;
			h = safeZoneH * 0.6;
		};
		class Header : Rsc_lable
		{
			x = safeZoneX + safeZoneW * 0.25;
			y = safeZoneY + safeZoneH * 0.2;
			w = safeZoneW * 0.5;
			h = safeZoneH * 0.05;
			text = "Cicada Municipal Court - Hearing";
		};
	};
	
	class Controls
	{
		class txt_caseInfo : RscText
		{
			idc = 3001;
			x = safeZoneX + safeZoneW * 0.27;
			y = safeZoneY + safeZoneH * 0.28;
			w = safeZoneW * 0.46;
			h = safeZoneH * 0.15;
			text = "Case Information";
			style = ST_MULTI;
		};
		class lbl_sentence : RscText
		{
			idc = 3002;
			x = safeZoneX + safeZoneW * 0.27;
			y = safeZoneY + safeZoneH * 0.45;
			w = safeZoneW * 0.15;
			h = safeZoneH * 0.04;
			text = "Sentence (minutes):";
		};
		class edit_sentence : RscEdit
		{
			idc = 3003;
			x = safeZoneX + safeZoneW * 0.27;
			y = safeZoneY + safeZoneH * 0.49;
			w = safeZoneW * 0.2;
			h = safeZoneH * 0.04;
			text = "0";
		};
		class lbl_fine : RscText
		{
			idc = 3004;
			x = safeZoneX + safeZoneW * 0.27;
			y = safeZoneY + safeZoneH * 0.55;
			w = safeZoneW * 0.15;
			h = safeZoneH * 0.04;
			text = "Fine ($):";
		};
		class edit_fine : RscEdit
		{
			idc = 3005;
			x = safeZoneX + safeZoneW * 0.27;
			y = safeZoneY + safeZoneH * 0.59;
			w = safeZoneW * 0.2;
			h = safeZoneH * 0.04;
			text = "0";
		};
		class btn_guilty : RscButton
		{
			x = safeZoneX + safeZoneW * 0.35;
			y = safeZoneY + safeZoneH * 0.7;
			w = safeZoneW * 0.1;
			h = safeZoneH * 0.04;
			text = "Guilty";
			action = "[3003, 3005] call court_pronounceVerdict_guilty";
		};
		class btn_notGuilty : RscButton
		{
			x = safeZoneX + safeZoneW * 0.47;
			y = safeZoneY + safeZoneH * 0.7;
			w = safeZoneW * 0.1;
			h = safeZoneH * 0.04;
			text = "Not Guilty";
			action = "[] call court_pronounceVerdict_notGuilty";
		};
		class btn_dismiss : RscButton
		{
			x = safeZoneX + safeZoneW * 0.59;
			y = safeZoneY + safeZoneH * 0.7;
			w = safeZoneW * 0.1;
			h = safeZoneH * 0.04;
			text = "Dismiss";
			action = "[] call court_endHearing";
		};
		class btn_close : RscButton
		{
			x = safeZoneX + safeZoneW * 0.73;
			y = safeZoneY + safeZoneH * 0.2;
			w = safeZoneW * 0.02;
			h = safeZoneH * 0.04;
			text = "X";
			action = "closeDialog 0;";
		};
	};
	
	onLoad = "[] call court_loadHearingInfo;";
};

// ------------------------------------------------------------
// Civilian court services menu (tickets / warrants / court dates)
// ------------------------------------------------------------
class court_civMenu
{
	idd = 7100;
	moveEnable = true;
	enableSimulation = true;
	onLoad = "[] call court_loadCivMenu;";

	class ControlsBackground
	{
		class Background : RscBackground
		{
			x = safeZoneX + safeZoneW * 0.15;
			y = safeZoneY + safeZoneH * 0.12;
			w = safeZoneW * 0.7;
			h = safeZoneH * 0.76;
		};
		class Header : Rsc_lable
		{
			x = safeZoneX + safeZoneW * 0.15;
			y = safeZoneY + safeZoneH * 0.12;
			w = safeZoneW * 0.7;
			h = safeZoneH * 0.05;
			text = "Cicada Municipal Court - Services";
		};
	};

	class Controls
	{
		class lbl_Tickets : RscText
		{
			idc = 7109;
			x = safeZoneX + safeZoneW * 0.17;
			y = safeZoneY + safeZoneH * 0.19;
			w = safeZoneW * 0.2;
			h = safeZoneH * 0.03;
			text = "Your Tickets";
		};
		class list_Tickets : RscListBox
		{
			idc = 7101;
			x = safeZoneX + safeZoneW * 0.17;
			y = safeZoneY + safeZoneH * 0.23;
			w = safeZoneW * 0.32;
			h = safeZoneH * 0.45;
		};

		class lbl_Cases : RscText
		{
			idc = 7110;
			x = safeZoneX + safeZoneW * 0.51;
			y = safeZoneY + safeZoneH * 0.19;
			w = safeZoneW * 0.3;
			h = safeZoneH * 0.03;
			text = "Your Court Dates / Cases";
		};
		class list_Cases : RscListBox
		{
			idc = 7102;
			x = safeZoneX + safeZoneW * 0.51;
			y = safeZoneY + safeZoneH * 0.23;
			w = safeZoneW * 0.32;
			h = safeZoneH * 0.25;
		};

		class lbl_Warrants : RscText
		{
			idc = 7111;
			x = safeZoneX + safeZoneW * 0.51;
			y = safeZoneY + safeZoneH * 0.50;
			w = safeZoneW * 0.3;
			h = safeZoneH * 0.03;
			text = "Your Warrants";
		};
		class list_Warrants : RscListBox
		{
			idc = 7103;
			x = safeZoneX + safeZoneW * 0.51;
			y = safeZoneY + safeZoneH * 0.54;
			w = safeZoneW * 0.32;
			h = safeZoneH * 0.14;
		};

		class btn_PayTicket : RscButton
		{
			idc = 7104;
			x = safeZoneX + safeZoneW * 0.17;
			y = safeZoneY + safeZoneH * 0.70;
			w = safeZoneW * 0.14;
			h = safeZoneH * 0.04;
			text = "Pay Selected Ticket";
			action = "[] call court_payTicket;";
		};
		class btn_Refresh : RscButton
		{
			idc = 7105;
			x = safeZoneX + safeZoneW * 0.33;
			y = safeZoneY + safeZoneH * 0.70;
			w = safeZoneW * 0.08;
			h = safeZoneH * 0.04;
			text = "Refresh";
			action = "[] call court_loadCivMenu;";
		};
		class btn_Close : RscButton
		{
			idc = 7106;
			x = safeZoneX + safeZoneW * 0.81;
			y = safeZoneY + safeZoneH * 0.12;
			w = safeZoneW * 0.04;
			h = safeZoneH * 0.05;
			text = "X";
			action = "closeDialog 0;";
		};
	};
};

class court_hearing_defendant
{
	idd = -1;
	
	class ControlsBackground
	{
		class Background : RscBackground
		{
			x = safeZoneX + safeZoneW * 0.3;
			y = safeZoneY + safeZoneH * 0.3;
			w = safeZoneW * 0.4;
			h = safeZoneH * 0.4;
		};
		class Header : Rsc_lable
		{
			x = safeZoneX + safeZoneW * 0.3;
			y = safeZoneY + safeZoneH * 0.3;
			w = safeZoneW * 0.4;
			h = safeZoneH * 0.05;
			text = "Court Hearing - Your Case";
		};
	};
	
	class Controls
	{
		class txt_caseInfo : RscText
		{
			idc = 4001;
			x = safeZoneX + safeZoneW * 0.32;
			y = safeZoneY + safeZoneH * 0.38;
			w = safeZoneW * 0.36;
			h = safeZoneH * 0.25;
			text = "Your case is being heard. Please wait for the judge's verdict.";
			style = ST_MULTI;
		};
		class btn_close : RscButton
		{
			x = safeZoneX + safeZoneW * 0.68;
			y = safeZoneY + safeZoneH * 0.3;
			w = safeZoneW * 0.02;
			h = safeZoneH * 0.04;
			text = "X";
			action = "closeDialog 0;";
		};
	};
	
	onLoad = "[] call court_loadDefendantInfo;";
};
