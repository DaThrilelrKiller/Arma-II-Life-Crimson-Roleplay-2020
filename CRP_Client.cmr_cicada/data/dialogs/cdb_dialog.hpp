class cdb_warrant{
	idd=-1;
	controlsBackground[] = {};
	objects[] = {};
	controls[] = {RscFrame_1800,RscText_1000,RscEdit_1400,RscShortcutButton_1700};
	
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
			x = 0.461458 * safezoneW + safezoneX;
			y = 0.458333 * safezoneH + safezoneY;
			w = 0.0823958 * safezoneW;
			h = 0.0411112 * safezoneH;
		};
		class RscEdit_1400: RscEdit
		{
			idc = 1400;
			x = 0.377604 * safezoneW + safezoneX;
			y = 0.500926 * safezoneH + safezoneY;
			w = 0.219895 * safezoneW;
			h = 0.0253702 * safezoneH;
		};
		class RscShortcutButton_1700: RscShortcutButton
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
	controls[] = {RscFrame_1800,RscText_1000,RscEdit_1400,RscShortcutButton_1700};
	
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
			x = 0.461458 * safezoneW + safezoneX;
			y = 0.458333 * safezoneH + safezoneY;
			w = 0.0823958 * safezoneW;
			h = 0.0411112 * safezoneH;
		};
		class RscEdit_1400: RscEdit
		{
			idc = 1400;
			x = 0.377604 * safezoneW + safezoneX;
			y = 0.500926 * safezoneH + safezoneY;
			w = 0.219895 * safezoneW;
			h = 0.0253702 * safezoneH;
		};
		class RscShortcutButton_1700: RscShortcutButton
		{
			idc = 1700;
			text = "Submit Query";
			x = 0.442187 * safezoneW + safezoneX;
			y = 0.523148 * safezoneH + safezoneY;
			w = 0.101667 * safezoneW;
			h = 0.0605556 * safezoneH;
			action = "[cdb_object,CtrlText 1400]call cdb_addNote; closeDialog 0; ";
		};
};



class cdb_search
{
	idd=-1;
	moveEnable = false;
	enableSimulation = true;
	onUnLoad = "cdb_object = nil;";
	
	class ControlsBackground
	{
		class RscPicture_1201 : RscPicture 
		{
			idc = 1201;
			x = 0.164844*safezoneW+safezoneX;
			y = 0.049*safezoneH+safezoneY;
			w = 1.14984*safezoneW;
			h = 0.913*safezoneH;
			text = "data\images\ipad\PoliceComputer.paa";
			
		};
		
	};
	class Controls
	{
		class Submit_Warants : Swag_RscButton 
		{
			idc = 1600;
			x = 0.206094*safezoneW+safezoneX;
			y = 0.214*safezoneH+safezoneY;
			w = 0.12375*safezoneW;
			h = 0.044*safezoneH;
			action = "createDialog 'cdb_warrant'";
			
		};
		class Submit_Notes : Swag_RscButton 
		{
			idc = 1601;
			x = 0.206094*safezoneW+safezoneX;
			y = 0.269*safezoneH+safezoneY;
			w = 0.12375*safezoneW;
			h = 0.044*safezoneH;
			action = "createDialog 'cdb_note'";
			
		};
		class Clear_Warrants : Swag_RscButton 
		{
			idc = 1602;
			x = 0.206094*safezoneW+safezoneX;
			y = 0.335*safezoneH+safezoneY;
			w = 0.12375*safezoneW;
			h = 0.033*safezoneH;
			action = "cdb_object call cdb_clear_warrants;";
			
		};
		class Search_box : RscEdit 
		{
			idc = 1;
			x = 0.579427*safezoneW+safezoneX;
			y = 0.108519*safezoneH+safezoneY;
			w = 0.182396*safezoneW;
			h = 0.0292963*safezoneH;
			colorBackground[] = {0.7294,0.6,0.5804,1};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorText[] = {0.23,0.34,0.98,1};
			
		};
		class Search_Button : Swag_RscButton 
		{
			idc = 1603;
			x = 0.762969*safezoneW+safezoneX;
			y = 0.104*safezoneH+safezoneY;
			w = 0.0309375*safezoneW;
			h = 0.033*safezoneH;
			action = "[ctrltext 1] call cdb_search;";
			
		};
		class Active_Warrants : RscListBox 
		{
			idc = 2;
			x = safeZoneX + safeZoneW * 0.38125;
			y = safeZoneY + safeZoneH * 0.21444445;
			w = safeZoneW * 0.4075;
			h = safeZoneH * 0.52333334;
			colorDisabled[] = {0.2,0.2,0.2,1};	
			onLBDblClick = "_this call cdb_DblClick";
		};
		
	};
	
};
