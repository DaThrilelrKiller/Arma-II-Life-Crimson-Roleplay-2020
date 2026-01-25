// Redesigned Police Computer System
// Main Computer Interface
class cdb_search_new
{
	idd = -1;
	moveEnable = true;
	enableSimulation = true;
	onUnLoad = "cdb_object = nil;";
	
	class ControlsBackground
	{
		class Background : RscBackground
		{
			x = safeZoneX + safeZoneW * 0.1;
			y = safeZoneY + safeZoneH * 0.1;
			w = safeZoneW * 0.8;
			h = safeZoneH * 0.8;
			colorBackground[] = {0.1, 0.1, 0.15, 0.95};
		};
		class Header : RscText
		{
			x = safeZoneX + safeZoneW * 0.1;
			y = safeZoneY + safeZoneH * 0.1;
			w = safeZoneW * 0.8;
			h = safeZoneH * 0.06;
			text = "CICADA CRIME INFORMATION CENTER";
			colorBackground[] = {0.2, 0.2, 0.4, 1};
			colorText[] = {1, 1, 1, 1};
			sizeEx = 0.05;
			style = ST_CENTER;
		};
	};
	
	class Controls
	{
		// Left Panel - Navigation
		class NavPanel : RscBackground
		{
			x = safeZoneX + safeZoneW * 0.12;
			y = safeZoneY + safeZoneH * 0.18;
			w = safeZoneW * 0.18;
			h = safeZoneH * 0.7;
			colorBackground[] = {0.15, 0.15, 0.2, 0.9};
		};
		
		class btn_Search : RscButton
		{
			idc = 2001;
			x = safeZoneX + safeZoneW * 0.13;
			y = safeZoneY + safeZoneH * 0.2;
			w = safeZoneW * 0.16;
			h = safeZoneH * 0.05;
			text = "Database Search";
			action = "[] call cdb_search;";
		};
		
		class btn_NewReport : RscButton
		{
			idc = 2002;
			x = safeZoneX + safeZoneW * 0.13;
			y = safeZoneY + safeZoneH * 0.27;
			w = safeZoneW * 0.16;
			h = safeZoneH * 0.05;
			text = "File Police Report";
			action = "[] call cdb_openReport;";
		};

		class btn_IssueTicket : RscButton
		{
			idc = 2015;
			x = safeZoneX + safeZoneW * 0.13;
			y = safeZoneY + safeZoneH * 0.34;
			w = safeZoneW * 0.16;
			h = safeZoneH * 0.05;
			text = "Issue Ticket";
			action = "[] call cdb_openTicket;";
		};
		
		class btn_ViewReports : RscButton
		{
			idc = 2003;
			x = safeZoneX + safeZoneW * 0.13;
			y = safeZoneY + safeZoneH * 0.41;
			w = safeZoneW * 0.16;
			h = safeZoneH * 0.05;
			text = "View Reports";
			action = "[] call cdb_viewReports;";
		};
		
		class btn_AddWarrant : RscButton
		{
			idc = 2004;
			x = safeZoneX + safeZoneW * 0.13;
			y = safeZoneY + safeZoneH * 0.48;
			w = safeZoneW * 0.16;
			h = safeZoneH * 0.05;
			text = "Issue Warrant";
			action = "createDialog 'cdb_warrant';";
		};
		
		class btn_AddNote : RscButton
		{
			idc = 2005;
			x = safeZoneX + safeZoneW * 0.13;
			y = safeZoneY + safeZoneH * 0.55;
			w = safeZoneW * 0.16;
			h = safeZoneH * 0.05;
			text = "Add Note";
			action = "createDialog 'cdb_note';";
		};
		
		class btn_ClearWarrants : RscButton
		{
			idc = 2006;
			x = safeZoneX + safeZoneW * 0.13;
			y = safeZoneY + safeZoneH * 0.62;
			w = safeZoneW * 0.16;
			h = safeZoneH * 0.05;
			text = "Clear Warrants";
			action = "cdb_object call cdb_clear_warrants;";
		};
		
		class btn_Close : RscButton
		{
			idc = 2007;
			x = safeZoneX + safeZoneW * 0.13;
			y = safeZoneY + safeZoneH * 0.82;
			w = safeZoneW * 0.16;
			h = safeZoneH * 0.05;
			text = "Close System";
			action = "closeDialog 0;";
		};
		
		// Right Panel - Search and Results
		class SearchPanel : RscBackground
		{
			x = safeZoneX + safeZoneW * 0.32;
			y = safeZoneY + safeZoneH * 0.18;
			w = safeZoneW * 0.56;
			h = safeZoneH * 0.7;
			colorBackground[] = {0.12, 0.12, 0.18, 0.9};
		};
		
		class lbl_Search : RscText
		{
			idc = 2008;
			x = safeZoneX + safeZoneW * 0.34;
			y = safeZoneY + safeZoneH * 0.2;
			w = safeZoneW * 0.1;
			h = safeZoneH * 0.04;
			text = "Search:";
			colorText[] = {1, 1, 1, 1};
		};
		
		class Search_box : RscEdit
		{
			idc = 1;
			x = safeZoneX + safeZoneW * 0.44;
			y = safeZoneY + safeZoneH * 0.2;
			w = safeZoneW * 0.35;
			h = safeZoneH * 0.04;
			colorBackground[] = {0.2, 0.2, 0.25, 1};
			colorText[] = {1, 1, 1, 1};
		};
		
		class Search_Button : RscButton
		{
			idc = 1603;
			x = safeZoneX + safeZoneW * 0.8;
			y = safeZoneY + safeZoneH * 0.2;
			w = safeZoneW * 0.06;
			h = safeZoneH * 0.04;
			text = "Search";
			action = "[ctrltext 1] call cdb_search;";
		};
		
		class Results_List : RscListBox
		{
			idc = 2;
			x = safeZoneX + safeZoneW * 0.34;
			y = safeZoneY + safeZoneH * 0.26;
			w = safeZoneW * 0.52;
			h = safeZoneH * 0.6;
			colorBackground[] = {0.1, 0.1, 0.15, 1};
			colorText[] = {0.9, 0.9, 0.9, 1};
			onLBDblClick = "_this call cdb_DblClick;";
		};
		
		// Hidden legacy listboxes (old `cdb_search.sqf` clears 3 and 4)
		class Legacy_List3 : RscListBox
		{
			idc = 3;
			x = -10;
			y = -10;
			w = 0;
			h = 0;
		};
		class Legacy_List4 : RscListBox
		{
			idc = 4;
			x = -10;
			y = -10;
			w = 0;
			h = 0;
		};
	};
};

// ------------------------------------------------------------------
// Legacy popups (moved from old `cdb_dialog.hpp` so we can remove it)
// ------------------------------------------------------------------

class cdb_warrant{
	idd=-1;
	controlsBackground[] = {};
	objects[] = {};
	controls[] = {RscFrame_1800,RscText_1000,RscEdit_1400,RscButton_1700};
	
 		class RscFrame_1800: RscBackground
		{
			idc = 1800;
			x = 0.331771 * safezoneW + safezoneX;
			y = 0.447222 * safezoneH + safezoneY;
			w = 0.340209 * safezoneW;
			h = 0.127222 * safezoneH;
		};
		class RscText_1000: RscText
		{
			idc = 1000;
			text = "Submit Warrant";
			x = 0.331771 * safezoneW + safezoneX;
			y = 0.447222 * safezoneH + safezoneY;
			w = 0.340209 * safezoneW;
			h = 0.035 * safezoneH;
			style = ST_CENTER;
			sizeEx = 0.04;
			colorBackground[] = {0.2, 0.2, 0.4, 1};
		};
		class RscEdit_1400: RscEdit
		{
			idc = 1400;
			x = 0.377604 * safezoneW + safezoneX;
			y = 0.500926 * safezoneH + safezoneY;
			w = 0.219895 * safezoneW;
			h = 0.0253702 * safezoneH;
		};
		class RscButton_1700: RscButton
		{
			idc = 1700;
			text = "Submit Query";
			x = 0.442187 * safezoneW + safezoneX;
			y = 0.523148 * safezoneH + safezoneY;
			w = 0.101667 * safezoneW;
			h = 0.0605556 * safezoneH;
			action = "[cdb_object,CtrlText 1400]call cdb_addWarrant; closeDialog 0;";
		};
};

class cdb_note{
	idd=-1;
	controlsBackground[] = {};
	objects[] = {};
	controls[] = {RscFrame_1800,RscText_1000,RscEdit_1400,RscButton_1700};
	
 		class RscFrame_1800: RscBackground
		{
			idc = 1800;
			x = 0.331771 * safezoneW + safezoneX;
			y = 0.447222 * safezoneH + safezoneY;
			w = 0.340209 * safezoneW;
			h = 0.127222 * safezoneH;
		};
		class RscText_1000: RscText
		{
			idc = 1000;
			text = "Submit Note";
			x = 0.331771 * safezoneW + safezoneX;
			y = 0.447222 * safezoneH + safezoneY;
			w = 0.340209 * safezoneW;
			h = 0.035 * safezoneH;
			style = ST_CENTER;
			sizeEx = 0.04;
			colorBackground[] = {0.2, 0.2, 0.4, 1};
		};
		class RscEdit_1400: RscEdit
		{
			idc = 1400;
			x = 0.377604 * safezoneW + safezoneX;
			y = 0.500926 * safezoneH + safezoneY;
			w = 0.219895 * safezoneW;
			h = 0.0253702 * safezoneH;
		};
		class RscButton_1700: RscButton
		{
			idc = 1700;
			text = "Submit Query";
			x = 0.442187 * safezoneW + safezoneX;
			y = 0.523148 * safezoneH + safezoneY;
			w = 0.101667 * safezoneW;
			h = 0.0605556 * safezoneH;
			action = "[cdb_object,CtrlText 1400]call cdb_addNote; closeDialog 0;";
		};
};

// Ticket issuance dialog (new ticket system; persists to court)
class cdb_ticketIssue
{
	idd = 7200;
	moveEnable = true;
	enableSimulation = true;

	class ControlsBackground
	{
		class Background : RscBackground
		{
			x = safeZoneX + safeZoneW * 0.3;
			y = safeZoneY + safeZoneH * 0.25;
			w = safeZoneW * 0.4;
			h = safeZoneH * 0.45;
			colorBackground[] = {0.1, 0.1, 0.15, 0.95};
		};
		class Header : RscText
		{
			x = safeZoneX + safeZoneW * 0.3;
			y = safeZoneY + safeZoneH * 0.25;
			w = safeZoneW * 0.4;
			h = safeZoneH * 0.05;
			text = "ISSUE TICKET";
			colorBackground[] = {0.2, 0.2, 0.4, 1};
			colorText[] = {1, 1, 1, 1};
			style = ST_CENTER;
		};
	};

	class Controls
	{
		class lbl_Suspect : RscText
		{
			idc = 7201;
			x = safeZoneX + safeZoneW * 0.32;
			y = safeZoneY + safeZoneH * 0.32;
			w = safeZoneW * 0.12;
			h = safeZoneH * 0.03;
			text = "Suspect (Name/UID):";
			colorText[] = {1,1,1,1};
		};
		class edit_Suspect : RscEdit
		{
			idc = 7202;
			x = safeZoneX + safeZoneW * 0.45;
			y = safeZoneY + safeZoneH * 0.32;
			w = safeZoneW * 0.23;
			h = safeZoneH * 0.03;
			colorBackground[] = {0.2,0.2,0.25,1};
			colorText[] = {1,1,1,1};
		};
		class lbl_Online : RscText
		{
			idc = 7209;
			x = safeZoneX + safeZoneW * 0.32;
			y = safeZoneY + safeZoneH * 0.355;
			w = safeZoneW * 0.12;
			h = safeZoneH * 0.03;
			text = "Online Player:";
			colorText[] = {1,1,1,1};
		};
		class combo_Online : RscCombo
		{
			idc = 7210;
			x = safeZoneX + safeZoneW * 0.45;
			y = safeZoneY + safeZoneH * 0.355;
			w = safeZoneW * 0.23;
			h = safeZoneH * 0.03;
			colorBackground[] = {0.2,0.2,0.25,1};
			onLBSelChanged = "ctrlSetText [7202, (_this select 0) lbText (_this select 1)];";
		};

		class lbl_Amount : RscText
		{
			idc = 7203;
			x = safeZoneX + safeZoneW * 0.32;
			y = safeZoneY + safeZoneH * 0.40;
			w = safeZoneW * 0.12;
			h = safeZoneH * 0.03;
			text = "Amount ($):";
			colorText[] = {1,1,1,1};
		};
		class edit_Amount : RscEdit
		{
			idc = 7204;
			x = safeZoneX + safeZoneW * 0.45;
			y = safeZoneY + safeZoneH * 0.40;
			w = safeZoneW * 0.23;
			h = safeZoneH * 0.03;
			colorBackground[] = {0.2,0.2,0.25,1};
			colorText[] = {1,1,1,1};
			text = "0";
		};

		class lbl_Reason : RscText
		{
			idc = 7205;
			x = safeZoneX + safeZoneW * 0.32;
			y = safeZoneY + safeZoneH * 0.45;
			w = safeZoneW * 0.12;
			h = safeZoneH * 0.03;
			text = "Reason:";
			colorText[] = {1,1,1,1};
		};
		class edit_Reason : RscEdit
		{
			idc = 7206;
			x = safeZoneX + safeZoneW * 0.32;
			y = safeZoneY + safeZoneH * 0.49;
			w = safeZoneW * 0.36;
			h = safeZoneH * 0.12;
			style = ST_MULTI;
			colorBackground[] = {0.2,0.2,0.25,1};
			colorText[] = {1,1,1,1};
		};

		class btn_Submit : RscButton
		{
			idc = 7207;
			x = safeZoneX + safeZoneW * 0.32;
			y = safeZoneY + safeZoneH * 0.64;
			w = safeZoneW * 0.16;
			h = safeZoneH * 0.04;
			text = "Issue Ticket";
			action = "[] call cdb_submitTicket;";
		};
		class btn_Close : RscButton
		{
			idc = 7208;
			x = safeZoneX + safeZoneW * 0.64;
			y = safeZoneY + safeZoneH * 0.25;
			w = safeZoneW * 0.06;
			h = safeZoneH * 0.05;
			text = "X";
			action = "closeDialog 0;";
		};
	};
};

// Police Report Submission Dialog
class cdb_policeReport
{
	idd = -1;
	moveEnable = true;
	
	class ControlsBackground
	{
		class Background : RscBackground
		{
			x = safeZoneX + safeZoneW * 0.25;
			y = safeZoneY + safeZoneH * 0.15;
			w = safeZoneW * 0.5;
			h = safeZoneH * 0.7;
			colorBackground[] = {0.1, 0.1, 0.15, 0.95};
		};
		class Header : RscText
		{
			x = safeZoneX + safeZoneW * 0.25;
			y = safeZoneY + safeZoneH * 0.15;
			w = safeZoneW * 0.5;
			h = safeZoneH * 0.06;
			text = "CICADA CRIME INFORMATION CENTER";
			colorBackground[] = {0.2, 0.2, 0.4, 1};
			colorText[] = {1, 1, 1, 1};
			sizeEx = 0.05;
			style = ST_CENTER;
		};
	};
	
	class Controls
	{
		class lbl_Suspect : RscText
		{
			idc = 5000;
			x = safeZoneX + safeZoneW * 0.27;
			y = safeZoneY + safeZoneH * 0.24;
			w = safeZoneW * 0.15;
			h = safeZoneH * 0.04;
			text = "Suspect Name:";
			colorText[] = {1, 1, 1, 1};
		};
		
		class edit_Suspect : RscEdit
		{
			idc = 5001;
			x = safeZoneX + safeZoneW * 0.42;
			y = safeZoneY + safeZoneH * 0.24;
			w = safeZoneW * 0.3;
			h = safeZoneH * 0.04;
			colorBackground[] = {0.2, 0.2, 0.25, 1};
			colorText[] = {1, 1, 1, 1};
		};

		class lbl_OnlineSuspect : RscText
		{
			idc = 5013;
			x = safeZoneX + safeZoneW * 0.27;
			y = safeZoneY + safeZoneH * 0.285;
			w = safeZoneW * 0.15;
			h = safeZoneH * 0.03;
			text = "Online Player:";
			colorText[] = {1, 1, 1, 1};
		};
		class combo_OnlineSuspect : RscCombo
		{
			idc = 5014;
			x = safeZoneX + safeZoneW * 0.42;
			y = safeZoneY + safeZoneH * 0.285;
			w = safeZoneW * 0.3;
			h = safeZoneH * 0.03;
			colorBackground[] = {0.2, 0.2, 0.25, 1};
			onLBSelChanged = "ctrlSetText [5001, (_this select 0) lbText (_this select 1)];";
		};
		
		class lbl_Type : RscText
		{
			idc = 5002;
			x = safeZoneX + safeZoneW * 0.27;
			y = safeZoneY + safeZoneH * 0.33;
			w = safeZoneW * 0.15;
			h = safeZoneH * 0.04;
			text = "Report Type:";
			colorText[] = {1, 1, 1, 1};
		};
		
		class combo_Type : RscCombo
		{
			idc = 5003;
			x = safeZoneX + safeZoneW * 0.42;
			y = safeZoneY + safeZoneH * 0.33;
			w = safeZoneW * 0.3;
			h = safeZoneH * 0.04;
			colorBackground[] = {0.2, 0.2, 0.25, 1};
		};
		
		class lbl_Details : RscText
		{
			idc = 5004;
			x = safeZoneX + safeZoneW * 0.27;
			y = safeZoneY + safeZoneH * 0.39;
			w = safeZoneW * 0.15;
			h = safeZoneH * 0.04;
			text = "Incident Details:";
			colorText[] = {1, 1, 1, 1};
		};
		
		class edit_Details : RscEdit
		{
			idc = 5005;
			x = safeZoneX + safeZoneW * 0.27;
			y = safeZoneY + safeZoneH * 0.44;
			w = safeZoneW * 0.45;
			h = safeZoneH * 0.15;
			style = ST_MULTI;
			colorBackground[] = {0.2, 0.2, 0.25, 1};
			colorText[] = {1, 1, 1, 1};
		};
		
		class btn_WarrantToggle : RscButton
		{
			idc = 5011;
			x = safeZoneX + safeZoneW * 0.27;
			y = safeZoneY + safeZoneH * 0.61;
			w = safeZoneW * 0.2;
			h = safeZoneH * 0.04;
			text = "Request Warrant: NO";
			action = "[] call cdb_toggleWarrantRequest;";
		};
		
		class lbl_WarrantReason : RscText
		{
			idc = 5007;
			x = safeZoneX + safeZoneW * 0.27;
			y = safeZoneY + safeZoneH * 0.66;
			w = safeZoneW * 0.15;
			h = safeZoneH * 0.04;
			text = "Warrant Reason:";
			colorText[] = {1, 1, 1, 1};
		};
		
		class edit_WarrantReason : RscEdit
		{
			idc = 5012;
			x = safeZoneX + safeZoneW * 0.42;
			y = safeZoneY + safeZoneH * 0.66;
			w = safeZoneW * 0.3;
			h = safeZoneH * 0.04;
			colorBackground[] = {0.2, 0.2, 0.25, 1};
			colorText[] = {1, 1, 1, 1};
		};
		
		class lbl_WarrantAmount : RscText
		{
			idc = 5008;
			x = safeZoneX + safeZoneW * 0.27;
			y = safeZoneY + safeZoneH * 0.72;
			w = safeZoneW * 0.15;
			h = safeZoneH * 0.04;
			text = "Warrant Amount:";
			colorText[] = {1, 1, 1, 1};
		};
		
		class edit_WarrantAmount : RscEdit
		{
			idc = 5006;
			x = safeZoneX + safeZoneW * 0.42;
			y = safeZoneY + safeZoneH * 0.72;
			w = safeZoneW * 0.3;
			h = safeZoneH * 0.04;
			colorBackground[] = {0.2, 0.2, 0.25, 1};
			colorText[] = {1, 1, 1, 1};
			text = "0";
		};
		
		class btn_Submit : RscButton
		{
			idc = 5009;
			x = safeZoneX + safeZoneW * 0.35;
			y = safeZoneY + safeZoneH * 0.81;
			w = safeZoneW * 0.1;
			h = safeZoneH * 0.05;
			text = "Submit Report";
			action = "[] call cdb_policeReport;";
		};
		
		class btn_Cancel : RscButton
		{
			idc = 5010;
			x = safeZoneX + safeZoneW * 0.55;
			y = safeZoneY + safeZoneH * 0.81;
			w = safeZoneW * 0.1;
			h = safeZoneH * 0.05;
			text = "Cancel";
			action = "closeDialog 0;";
		};
	};
	
	onLoad = "[] call cdb_loadReportTypes;";
};

// Reports List and View Dialog
class cdb_reportsList
{
	idd = -1;
	moveEnable = true;
	
	class ControlsBackground
	{
		class Background : RscBackground
		{
			x = safeZoneX + safeZoneW * 0.15;
			y = safeZoneY + safeZoneH * 0.1;
			w = safeZoneW * 0.7;
			h = safeZoneH * 0.8;
			colorBackground[] = {0.1, 0.1, 0.15, 0.95};
		};
		class Header : RscText
		{
			x = safeZoneX + safeZoneW * 0.15;
			y = safeZoneY + safeZoneH * 0.1;
			w = safeZoneW * 0.7;
			h = safeZoneH * 0.06;
			text = "CICADA CRIME INFORMATION CENTER";
			colorBackground[] = {0.2, 0.2, 0.4, 1};
			colorText[] = {1, 1, 1, 1};
			sizeEx = 0.05;
			style = ST_CENTER;
		};
	};
	
	class Controls
	{
		class list_Reports : RscListBox
		{
			idc = 6001;
			x = safeZoneX + safeZoneW * 0.17;
			y = safeZoneY + safeZoneH * 0.18;
			w = safeZoneW * 0.3;
			h = safeZoneH * 0.6;
			colorBackground[] = {0.1, 0.1, 0.15, 1};
			colorText[] = {0.9, 0.9, 0.9, 1};
			onLBSelChanged = "[] call cdb_selectReport;";
		};
		
		class txt_ReportID : RscText
		{
			idc = 6002;
			x = safeZoneX + safeZoneW * 0.5;
			y = safeZoneY + safeZoneH * 0.18;
			w = safeZoneW * 0.32;
			h = safeZoneH * 0.04;
			text = "Report #";
			colorText[] = {1, 1, 1, 1};
		};
		
		class txt_Officer : RscText
		{
			idc = 6003;
			x = safeZoneX + safeZoneW * 0.5;
			y = safeZoneY + safeZoneH * 0.24;
			w = safeZoneW * 0.32;
			h = safeZoneH * 0.04;
			text = "Officer:";
			colorText[] = {1, 1, 1, 1};
		};
		
		class txt_Suspect : RscText
		{
			idc = 6004;
			x = safeZoneX + safeZoneW * 0.5;
			y = safeZoneY + safeZoneH * 0.3;
			w = safeZoneW * 0.32;
			h = safeZoneH * 0.04;
			text = "Suspect:";
			colorText[] = {1, 1, 1, 1};
		};
		
		class txt_Type : RscText
		{
			idc = 6005;
			x = safeZoneX + safeZoneW * 0.5;
			y = safeZoneY + safeZoneH * 0.36;
			w = safeZoneW * 0.32;
			h = safeZoneH * 0.04;
			text = "Type:";
			colorText[] = {1, 1, 1, 1};
		};
		
		class txt_Time : RscText
		{
			idc = 6006;
			x = safeZoneX + safeZoneW * 0.5;
			y = safeZoneY + safeZoneH * 0.42;
			w = safeZoneW * 0.32;
			h = safeZoneH * 0.04;
			text = "Time:";
			colorText[] = {1, 1, 1, 1};
		};
		
		class txt_Status : RscText
		{
			idc = 6007;
			x = safeZoneX + safeZoneW * 0.5;
			y = safeZoneY + safeZoneH * 0.48;
			w = safeZoneW * 0.32;
			h = safeZoneH * 0.04;
			text = "Status:";
			colorText[] = {1, 1, 1, 1};
		};
		
		class txt_Details : RscText
		{
			idc = 6008;
			x = safeZoneX + safeZoneW * 0.5;
			y = safeZoneY + safeZoneH * 0.54;
			w = safeZoneW * 0.32;
			h = safeZoneH * 0.15;
			text = "Details:";
			colorText[] = {1, 1, 1, 1};
			style = ST_MULTI;
		};
		
		class txt_Warrant : RscText
		{
			idc = 6009;
			x = safeZoneX + safeZoneW * 0.5;
			y = safeZoneY + safeZoneH * 0.71;
			w = safeZoneW * 0.32;
			h = safeZoneH * 0.07;
			text = "Warrant:";
			colorText[] = {1, 1, 1, 1};
			style = ST_MULTI;
		};
		
		class btn_Approve : RscButton
		{
			idc = 6010;
			x = safeZoneX + safeZoneW * 0.5;
			y = safeZoneY + safeZoneH * 0.8;
			w = safeZoneW * 0.1;
			h = safeZoneH * 0.05;
			text = "Approve Warrant";
			action = "[] call cdb_approveWarrant;";
		};
		
		class btn_Deny : RscButton
		{
			idc = 6011;
			x = safeZoneX + safeZoneW * 0.62;
			y = safeZoneY + safeZoneH * 0.8;
			w = safeZoneW * 0.1;
			h = safeZoneH * 0.05;
			text = "Deny Warrant";
			action = "[] call cdb_denyWarrant;";
		};
		
		class btn_Close : RscButton
		{
			idc = 6012;
			x = safeZoneX + safeZoneW * 0.74;
			y = safeZoneY + safeZoneH * 0.8;
			w = safeZoneW * 0.1;
			h = safeZoneH * 0.05;
			text = "Close";
			action = "closeDialog 0;";
		};
	};
	
	onLoad = "[] call cdb_loadReports; [] call cdb_reportsList_init;";
};
