class menu_pd
{
	idd = -1;
	
	class ControlsBackground
	{
		class RscBackground_2200 : RscBackground 
		{
			x = safeZoneX + safeZoneW * 0.43;
			y = safeZoneY + safeZoneH * 0.21111112;
			w = safeZoneW * 0.161875;
			h = safeZoneH * 0.51222223;
		};	
	};
	class Controls
	{
		class Control2125696138
		{
			type = 0;
			idc = 20;
			x = safeZoneX+safeZoneW*0.76875;
			y = safeZoneY+safeZoneH*1.00666667;
			w = safeZoneW*0.4125;
			h = safeZoneH*0.55;
			style = 0+48;
			text = "";
			colorBackground[] = {0.6784,0.5412,0.3176,1};
			colorText[] = {0.3216,0.4588,0.6824,1};
			font = "Zeppelin32";
			sizeEx = (((((safezoneW/safezoneH)min1.2)/1.2)/25)*1);
			
		};
		class button_Disarm : RscButton 
		{
			x = safeZoneX+safeZoneW*0.44;
			y = safeZoneY+safeZoneH*0.23;
			w = safeZoneW*0.143125;
			h = safeZoneH*0.03666667;
			text = "Disarm";
			action="dtk_unit call police_disarm";
		};
		class button_Inventory : RscButton 
		{
			x = safeZoneX+safeZoneW*0.44;
			y = safeZoneY+safeZoneH*0.27888889;
			w = safeZoneW*0.143125;
			h = safeZoneH*0.03666667;
			text = "Check Inventory";
			action = "[dtk_unit] call storage_seach;";
		};
		class button_Search : RscButton 
		{
			x = safeZoneX+safeZoneW*0.44;
			y = safeZoneY+safeZoneH*0.32777778;
			w = safeZoneW*0.143125;
			h = safeZoneH*0.03666667;
			text = "Drug Search";			
		};
		class button_Licence : RscButton 
		{
			x = safeZoneX+safeZoneW*0.44;
			y = safeZoneY+safeZoneH*0.37666667;
			w = safeZoneW*0.143125;
			h = safeZoneH*0.03666667;
			text = "Check Licence";	
			action="[dtk_unit]call licenses_check";
		};
		class button_arrest : RscButton 
		{
			x = safeZoneX + safeZoneW * 0.44;
			y = safeZoneY + safeZoneH * 0.42555556;
			w = safeZoneW * 0.143125;
			h = safeZoneH * 0.03666667;
			text = "Arrest";
			action="closeDialog 0;[]call jail_menu";
		};
		class button_ticket : RscButton 
		{
			x = safeZoneX+safeZoneW*0.44;
			y = safeZoneY+safeZoneH*0.47444445;
			w = safeZoneW*0.143125;
			h = safeZoneH*0.03666667;
			text = "Ticket";	
			action = "closedialog 0;[]call ticket_open;";			
		};
		class button_cuff : RscButton 
		{
			x = safeZoneX+safeZoneW*0.44;
			y = safeZoneY+safeZoneH*0.52333334;
			w = safeZoneW*0.143125;
			h = safeZoneH*0.03666667;
			action = "[dtk_unit]call cuffs_cuff; closedialog 0";
			text = "Handcuff/Release";			
		};
		class button_id : RscButton 
		{
			x = safeZoneX+safeZoneW*0.44;
			y = safeZoneY+safeZoneH*0.57222223;
			w = safeZoneW*0.143125;
			h = safeZoneH*0.03666667;
			text = "Get ID";	
			action = "closeDialog 0;[dtk_unit]call id_show;";
		};
		class button_extra2 : RscButton 
		{
			x = safeZoneX+safeZoneW*0.44;
			y = safeZoneY+safeZoneH*0.62111112;
			w = safeZoneW*0.143125;
			h = safeZoneH*0.03666667;
			text = "Put in Vehicle";		
			action = "[dtk_unit]spawn other_putplayerincar;"
		};
		class button_extra3 : RscButton 
		{
			x = safeZoneX + safeZoneW * 0.44;
			y = safeZoneY + safeZoneH * 0.67;
			w = safeZoneW * 0.143125;
			h = safeZoneH * 0.03666667;
			text = "";			
		};
		class lable_top : Rsc_lable 
		{
			idc = 2201;
			x = safeZoneX+safeZoneW*0.43;
			y = safeZoneY+safeZoneH*0.17666667;
			w = safeZoneW*0.1625;
			h = safeZoneH*0.03444445;
			text = "";
			
		};
		class close : RscButton 
		{
			idc = 1602;
			x = safeZoneX+safeZoneW*0.57375;
			y = safeZoneY+safeZoneH*0.17555556;
			w = safeZoneW*0.016875;
			h = safeZoneH*0.03333334;
			text = "X";
			action = "closeDialog 0";
			
		};
		
	};
};

class menu_civ
{
	idd = -1;
	
	class ControlsBackground
	{
		class RscBackground_2200 : RscBackground 
		{
			x = safeZoneX + safeZoneW * 0.43;
			y = safeZoneY + safeZoneH * 0.21111112;
			w = safeZoneW * 0.161875;
			h = safeZoneH * 0.51222223;
		};	
	};
	
	class Controls
	{
		class Control2125696138
		{
			type = 0;
			idc = 20;
			x = safeZoneX+safeZoneW*0.76875;
			y = safeZoneY+safeZoneH*1.00666667;
			w = safeZoneW*0.4125;
			h = safeZoneH*0.55;
			style = 0+48;
			text = "";
			colorBackground[] = {0.6784,0.5412,0.3176,1};
			colorText[] = {0.3216,0.4588,0.6824,1};
			font = "Zeppelin32";
			sizeEx = (((((safezoneW/safezoneH)min1.2)/1.2)/25)*1);
			
		};
		class button_steal : RscButton 
		{
			x = safeZoneX+safeZoneW*0.44;
			y = safeZoneY+safeZoneH*0.23;
			w = safeZoneW*0.143125;
			h = safeZoneH*0.03666667;
			text = $STRD_description_civmenu_steal;
			action="[20] execVM ""scripts\civmenuinit.sqf""; closedialog 0";
		};
		class button_Inventory : RscButton 
		{
			x = safeZoneX+safeZoneW*0.44;
			y = safeZoneY+safeZoneH*0.27888889;
			w = safeZoneW*0.143125;
			h = safeZoneH*0.03666667;
			text = $STRD_description_civmenu_inventar;
			action = "[6] execVM ""scripts\civmenuinit.sqf""; closedialog 0";
		};
		class button_Tieup : RscButton 
		{
			x = safeZoneX+safeZoneW*0.44;
			y = safeZoneY+safeZoneH*0.32777778;
			w = safeZoneW*0.143125;
			h = safeZoneH*0.03666667;
			text = $STRD_description_civmenu_ZipTie;	
			action = "execVM ""scripts\ziptie.sqf""; closedialog 0";
		};
		class button_Licence : RscButton 
		{
			x = safeZoneX+safeZoneW*0.44;
			y = safeZoneY+safeZoneH*0.37666667;
			w = safeZoneW*0.143125;
			h = safeZoneH*0.03666667;
			text = "";	
			action="";
		};
		class button_arrest : RscButton 
		{
			x = safeZoneX + safeZoneW * 0.44;
			y = safeZoneY + safeZoneH * 0.42555556;
			w = safeZoneW * 0.143125;
			h = safeZoneH * 0.03666667;
			text = "";
			action="";
		};
		class button_ticket : RscButton 
		{
			x = safeZoneX+safeZoneW*0.44;
			y = safeZoneY+safeZoneH*0.47444445;
			w = safeZoneW*0.143125;
			h = safeZoneH*0.03666667;
			text = "";	
			action = "";			
		};
		class button_cuff : RscButton 
		{
			x = safeZoneX+safeZoneW*0.44;
			y = safeZoneY+safeZoneH*0.52333334;
			w = safeZoneW*0.143125;
			h = safeZoneH*0.03666667;
			action = "";
			text = "";			
		};
		class button_id : RscButton 
		{
			x = safeZoneX+safeZoneW*0.44;
			y = safeZoneY+safeZoneH*0.57222223;
			w = safeZoneW*0.143125;
			h = safeZoneH*0.03666667;
			text = "";	
			action = "";
		};
		class button_extra2 : RscButton 
		{
			x = safeZoneX+safeZoneW*0.44;
			y = safeZoneY+safeZoneH*0.62111112;
			w = safeZoneW*0.143125;
			h = safeZoneH*0.03666667;
			text = "";			
		};
		class button_extra3 : RscButton 
		{
			x = safeZoneX + safeZoneW * 0.44;
			y = safeZoneY + safeZoneH * 0.67;
			w = safeZoneW * 0.143125;
			h = safeZoneH * 0.03666667;
			text = "";			
		};
		class lable_top : Rsc_lable 
		{
			idc = 2201;
			x = safeZoneX+safeZoneW*0.43;
			y = safeZoneY+safeZoneH*0.17666667;
			w = safeZoneW*0.1625;
			h = safeZoneH*0.03444445;
			text = "";
			
		};
		class close : RscButton 
		{
			idc = 1602;
			x = safeZoneX+safeZoneW*0.57375;
			y = safeZoneY+safeZoneH*0.17555556;
			w = safeZoneW*0.016875;
			h = safeZoneH*0.03333334;
			text = "X";
			action = "closeDialog 0";
			
		};
		
	};
};

class menu_un
{
	idd = -1;
	
	class ControlsBackground
	{
		class RscBackground_2200 : RscBackground 
		{
			x = safeZoneX + safeZoneW * 0.43;
			y = safeZoneY + safeZoneH * 0.21111112;
			w = safeZoneW * 0.161875;
			h = safeZoneH * 0.51222223;
		};	
	};
	
	class Controls
	{
		class Control2125696138
		{
			type = 0;
			idc = 20;
			x = safeZoneX+safeZoneW*0.76875;
			y = safeZoneY+safeZoneH*1.00666667;
			w = safeZoneW*0.4125;
			h = safeZoneH*0.55;
			style = 0+48;
			text = "";
			colorBackground[] = {0.6784,0.5412,0.3176,1};
			colorText[] = {0.3216,0.4588,0.6824,1};
			font = "Zeppelin32";
			sizeEx = (((((safezoneW/safezoneH)min1.2)/1.2)/25)*1);
			
		};
		class button_steal : RscButton 
		{
			x = safeZoneX+safeZoneW*0.44;
			y = safeZoneY+safeZoneH*0.23;
			w = safeZoneW*0.143125;
			h = safeZoneH*0.03666667;
			text = "";
			action="";
		};
		class button_Inventory : RscButton 
		{
			x = safeZoneX+safeZoneW*0.44;
			y = safeZoneY+safeZoneH*0.27888889;
			w = safeZoneW*0.143125;
			h = safeZoneH*0.03666667;
			text = "";
			action = "";
		};
		class button_Tieup : RscButton 
		{
			x = safeZoneX+safeZoneW*0.44;
			y = safeZoneY+safeZoneH*0.32777778;
			w = safeZoneW*0.143125;
			h = safeZoneH*0.03666667;
			text = "";	
			action = "";
		};
		class button_Licence : RscButton 
		{
			x = safeZoneX+safeZoneW*0.44;
			y = safeZoneY+safeZoneH*0.37666667;
			w = safeZoneW*0.143125;
			h = safeZoneH*0.03666667;
			text = "";	
			action="";
		};
		class button_arrest : RscButton 
		{
			x = safeZoneX + safeZoneW * 0.44;
			y = safeZoneY + safeZoneH * 0.42555556;
			w = safeZoneW * 0.143125;
			h = safeZoneH * 0.03666667;
			text = "";
			action="";
		};
		class button_ticket : RscButton 
		{
			x = safeZoneX+safeZoneW*0.44;
			y = safeZoneY+safeZoneH*0.47444445;
			w = safeZoneW*0.143125;
			h = safeZoneH*0.03666667;
			text = "";	
			action = "";			
		};
		class button_cuff : RscButton 
		{
			x = safeZoneX+safeZoneW*0.44;
			y = safeZoneY+safeZoneH*0.52333334;
			w = safeZoneW*0.143125;
			h = safeZoneH*0.03666667;
			action = "";
			text = "";			
		};
		class button_id : RscButton 
		{
			x = safeZoneX+safeZoneW*0.44;
			y = safeZoneY+safeZoneH*0.57222223;
			w = safeZoneW*0.143125;
			h = safeZoneH*0.03666667;
			text = "";	
			action = "";
		};
		class button_extra2 : RscButton 
		{
			x = safeZoneX+safeZoneW*0.44;
			y = safeZoneY+safeZoneH*0.62111112;
			w = safeZoneW*0.143125;
			h = safeZoneH*0.03666667;
			text = "";			
		};
		class button_extra3 : RscButton 
		{
			x = safeZoneX + safeZoneW * 0.44;
			y = safeZoneY + safeZoneH * 0.67;
			w = safeZoneW * 0.143125;
			h = safeZoneH * 0.03666667;
			text = "";			
		};
		class lable_top : Rsc_lable 
		{
			idc = 2201;
			x = safeZoneX+safeZoneW*0.43;
			y = safeZoneY+safeZoneH*0.17666667;
			w = safeZoneW*0.1625;
			h = safeZoneH*0.03444445;
			text = "";
			
		};
		class close : RscButton 
		{
			idc = 1602;
			x = safeZoneX+safeZoneW*0.57375;
			y = safeZoneY+safeZoneH*0.17555556;
			w = safeZoneW*0.016875;
			h = safeZoneH*0.03333334;
			text = "X";
			action = "closeDialog 0";
			
		};
		
	};
};

class vehicle_menu_pd
{
	idd = -1;
	
	class ControlsBackground
	{
		class RscBackground_2200 : RscBackground 
		{
			x = safeZoneX + safeZoneW * 0.43;
			y = safeZoneY + safeZoneH * 0.21111112;
			w = safeZoneW * 0.161875;
			h = safeZoneH * 0.51222223;
		};	
		class Control2125696138
		{
			type = 0;
			idc = 20;
			x = safeZoneX+safeZoneW*0.76875;
			y = safeZoneY+safeZoneH*1.00666667;
			w = safeZoneW*0.4125;
			h = safeZoneH*0.55;
			style = 0+48;
			text = "";
			colorBackground[] = {0.6784,0.5412,0.3176,1};
			colorText[] = {0.3216,0.4588,0.6824,1};
			font = "Zeppelin32";
			sizeEx = (((((safezoneW/safezoneH)min1.2)/1.2)/25)*1);
			
		};
	};
	class Controls
	{
		class button_getIn : RscButton 
		{
			idc = 99;
			x = safeZoneX+safeZoneW*0.44;
			y = safeZoneY+safeZoneH*0.23;
			w = safeZoneW*0.143125;
			h = safeZoneH*0.03666667;
			text = "Get In";
			action="[dtk_vehicle]call vehicle_getin;";
		};
		class button_Inv_driver : RscButton 
		{
			idc = 100;
			x = safeZoneX+safeZoneW*0.44;
			y = safeZoneY+safeZoneH*0.27888889;
			w = safeZoneW*0.143125;
			h = safeZoneH*0.03666667;
			text = "Check Inventory Driver";
			action = "[dtk_unit] call storage_seach;";
		};
		class button_Inv_vehicle : RscButton 
		{
			idc = 101;
			x = safeZoneX+safeZoneW*0.44;
			y = safeZoneY+safeZoneH*0.32777778;
			w = safeZoneW*0.143125;
			h = safeZoneH*0.03666667;
			text = "Check Inventory Vehicle";	
			action="[dtk_vehicle] call storage_seach;";
		};
		class button_Licence : RscButton 
		{
			idc = 102;
			x = safeZoneX+safeZoneW*0.44;
			y = safeZoneY+safeZoneH*0.37666667;
			w = safeZoneW*0.143125;
			h = safeZoneH*0.03666667;
			text = "Check Licences";	
			action="[dtk_unit]call licenses_check;";
		};
		class button_arrest : RscButton 
		{
			idc = 103;
			x = safeZoneX + safeZoneW * 0.44;
			y = safeZoneY + safeZoneH * 0.42555556;
			w = safeZoneW * 0.143125;
			h = safeZoneH * 0.03666667;
			text = "Ticket";
			action="closedialog 0;[]call ticket_open;";
		};
		class button_ticket : RscButton 
		{
			idc = 104;
			x = safeZoneX+safeZoneW*0.44;
			y = safeZoneY+safeZoneH*0.47444445;
			w = safeZoneW*0.143125;
			h = safeZoneH*0.03666667;
			text = "Pull Out";	
			action = "closeDialog 0; dtk_vehicle spawn Other_pullout;";			
		};
		class button_cuff : RscButton 
		{
			idc = 105;
			x = safeZoneX+safeZoneW*0.44;
			y = safeZoneY+safeZoneH*0.52333334;
			w = safeZoneW*0.143125;
			h = safeZoneH*0.03666667;
			action = "closeDialog 0;[dtk_unit]call id_show;";
			text = "Get ID";			
		};
		class button_id : RscButton 
		{
			idc = 106;
			x = safeZoneX+safeZoneW*0.44;
			y = safeZoneY+safeZoneH*0.57222223;
			w = safeZoneW*0.143125;
			h = safeZoneH*0.03666667;
			text = "Collect Fingerprints";	
			action = "[]spawn fingerprints_gather; closedialog 0;";
		};
		class button_extra2 : RscButton 
		{
			idc=107;
			x = safeZoneX+safeZoneW*0.44;
			y = safeZoneY+safeZoneH*0.62111112;
			w = safeZoneW*0.143125;
			h = safeZoneH*0.03666667;
			text="Impound";
			action = "[dtk_vehicle]call impound_add; closedialog 0;";			
		};
		class button_extra3 : RscButton 
		{
			idc=108;
			x = safeZoneX + safeZoneW * 0.44;
			y = safeZoneY + safeZoneH * 0.67;
			w = safeZoneW * 0.143125;
			h = safeZoneH * 0.03666667;
			text = "";			
		};
		class lable_top : Rsc_lable 
		{
			idc = 2201;
			x = safeZoneX+safeZoneW*0.43;
			y = safeZoneY+safeZoneH*0.17666667;
			w = safeZoneW*0.1625;
			h = safeZoneH*0.03444445;
			text = "";
			
		};
		class close : RscButton 
		{
			idc = 1602;
			x = safeZoneX+safeZoneW*0.57375;
			y = safeZoneY+safeZoneH*0.17555556;
			w = safeZoneW*0.016875;
			h = safeZoneH*0.03333334;
			text = "X";
			action = "closeDialog 0";
			
		};
		
	};
};

class vehicle_menu_un
{
	idd = -1;
	
	class ControlsBackground
	{
		class RscBackground_2200 : RscBackground 
		{
			x = safeZoneX + safeZoneW * 0.43;
			y = safeZoneY + safeZoneH * 0.21111112;
			w = safeZoneW * 0.161875;
			h = safeZoneH * 0.51222223;
		};	
		class Control2125696138
		{
			type = 0;
			idc = 20;
			x = safeZoneX+safeZoneW*0.76875;
			y = safeZoneY+safeZoneH*1.00666667;
			w = safeZoneW*0.4125;
			h = safeZoneH*0.55;
			style = 0+48;
			text = "";
			colorBackground[] = {0.6784,0.5412,0.3176,1};
			colorText[] = {0.3216,0.4588,0.6824,1};
			font = "Zeppelin32";
			sizeEx = (((((safezoneW/safezoneH)min1.2)/1.2)/25)*1);
			
		};
	};
	class Controls
	{
		class button_getIn : RscButton 
		{
			idc = 99;
			x = safeZoneX+safeZoneW*0.44;
			y = safeZoneY+safeZoneH*0.23;
			w = safeZoneW*0.143125;
			h = safeZoneH*0.03666667;
			text = "Get In";
			action="[dtk_vehicle]call vehicle_getin;";
		};
		class button_pullOut : RscButton 
		{
			idc = 100;
			x = safeZoneX+safeZoneW*0.44;
			y = safeZoneY+safeZoneH*0.27888889;
			w = safeZoneW*0.143125;
			h = safeZoneH*0.03666667;
			text = "Pull Out";	
			action = "closeDialog 0; dtk_vehicle spawn Other_pullout;";			
		};
		class button_impound : RscButton 
		{
			idc = 101;
			x = safeZoneX+safeZoneW*0.44;
			y = safeZoneY+safeZoneH*0.32777778;
			w = safeZoneW*0.143125;
			h = safeZoneH*0.03666667;
			text="Impound";
			action = "[dtk_vehicle]call impound_add; closedialog 0;";
		};
		class button_Licence : RscButton 
		{
			idc = 102;
			x = safeZoneX+safeZoneW*0.44;
			y = safeZoneY+safeZoneH*0.37666667;
			w = safeZoneW*0.143125;
			h = safeZoneH*0.03666667;
		};
		class button_arrest : RscButton 
		{
			idc = 103;
			x = safeZoneX + safeZoneW * 0.44;
			y = safeZoneY + safeZoneH * 0.42555556;
			w = safeZoneW * 0.143125;
			h = safeZoneH * 0.03666667;
		};
		class button_ticket : RscButton 
		{
			idc = 104;
			x = safeZoneX+safeZoneW*0.44;
			y = safeZoneY+safeZoneH*0.47444445;
			w = safeZoneW*0.143125;
			h = safeZoneH*0.03666667;
		};
		class button_cuff : RscButton 
		{
			idc = 105;
			x = safeZoneX+safeZoneW*0.44;
			y = safeZoneY+safeZoneH*0.52333334;
			w = safeZoneW*0.143125;
			h = safeZoneH*0.03666667;		
		};
		class button_id : RscButton 
		{
			idc = 106;
			x = safeZoneX+safeZoneW*0.44;
			y = safeZoneY+safeZoneH*0.57222223;
			w = safeZoneW*0.143125;
			h = safeZoneH*0.03666667;
		};
		class button_extra2 : RscButton 
		{
			idc=107;
			x = safeZoneX+safeZoneW*0.44;
			y = safeZoneY+safeZoneH*0.62111112;
			w = safeZoneW*0.143125;
			h = safeZoneH*0.03666667;		
		};
		class button_extra3 : RscButton 
		{
			idc=108;
			x = safeZoneX + safeZoneW * 0.44;
			y = safeZoneY + safeZoneH * 0.67;
			w = safeZoneW * 0.143125;
			h = safeZoneH * 0.03666667;
			text = "";			
		};
		class lable_top : Rsc_lable 
		{
			idc = 2201;
			x = safeZoneX+safeZoneW*0.43;
			y = safeZoneY+safeZoneH*0.17666667;
			w = safeZoneW*0.1625;
			h = safeZoneH*0.03444445;
			text = "";
			
		};
		class close : RscButton 
		{
			idc = 1602;
			x = safeZoneX+safeZoneW*0.57375;
			y = safeZoneY+safeZoneH*0.17555556;
			w = safeZoneW*0.016875;
			h = safeZoneH*0.03333334;
			text = "X";
			action = "closeDialog 0";
			
		};
		
	};
};