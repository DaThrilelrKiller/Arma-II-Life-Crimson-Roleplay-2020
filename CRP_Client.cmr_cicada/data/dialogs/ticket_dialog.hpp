class ticket_menu
{
	idd = -1;
	class ControlsBackground
	{
		class Background : RscBackground
		{
			x = safeZoneX + safeZoneW * 0.36875;
			y = safeZoneY + safeZoneH * 0.37111112;
			w = safeZoneW * 0.2625;
			h = safeZoneH * 0.23222223;
		};
		class Heder : Rsc_lable
		{
			x = safeZoneX + safeZoneW * 0.36875;
			y = safeZoneY + safeZoneH * 0.34666667;
			w = safeZoneW * 0.2625;
			h = safeZoneH * 0.03666667;
		};
		
	};
	class Controls
	{
		class btn_GiveTicket : RscButton
		{
			x = safeZoneX + safeZoneW * 0.52375;
			y = safeZoneY + safeZoneH * 0.54666667;
			w = safeZoneW * 0.0925;
			h = safeZoneH * 0.03888889;
			text = "Give Ticket";	
			action = "[]call ticket_send";
		};
		class btn_close : RscButton
		{
			x = safeZoneX + safeZoneW * 0.60375;
			y = safeZoneY + safeZoneH * 0.34666667;
			w = safeZoneW * 0.02625;
			h = safeZoneH * 0.03888889;
			text = "X";			
		};
		class ticket_amount : RscEdit
		{
			idc = 10;
			x = safeZoneX + safeZoneW * 0.383125;
			y = safeZoneY + safeZoneH * 0.54888889;
			w = safeZoneW * 0.116875;
			h = safeZoneH * 0.03222223;
			text = "";			
		};
		class ticket_reason : RscEdit 
		{
			idc = 11;
			x = safeZoneX + safeZoneW * 0.3875;
			y = safeZoneY + safeZoneH * 0.41;
			w = safeZoneW * 0.22375;
			h = safeZoneH * 0.09888889;
			text = "";
		};
		
	};
	
};

class ticket_pay
{
	idd = -1;
	onUnload="[]call ticket_no";
	
	class ControlsBackground
	{
		class Background : RscBackground
		{
			x = safeZoneX + safeZoneW * 0.36875;
			y = safeZoneY + safeZoneH * 0.37111112;
			w = safeZoneW * 0.2625;
			h = safeZoneH * 0.23222223;			
		};
		class Heder : rsc_Lable
		{
			x = safeZoneX + safeZoneW * 0.36875;
			y = safeZoneY + safeZoneH * 0.34666667;
			w = safeZoneW * 0.2625;
			h = safeZoneH * 0.03666667;			
		};
		
	};
	class Controls
	{
		class txt_reason : RscText
		{
			idc = 12;
			x = safeZoneX + safeZoneW * 0.3875;
			y = safeZoneY + safeZoneH * 0.41;
			w = safeZoneW * 0.22375;
			h = safeZoneH * 0.09888889;
		};
		class btn_no : RscButton
		{
			x = safeZoneX + safeZoneW * 0.4925;
			y = safeZoneY + safeZoneH * 0.53666667;
			w = safeZoneW * 0.0925;
			h = safeZoneH * 0.03888889;
			text = "No";			
			action = "closeDialog 0;";
		};
		class btn_pay : RscButton
		{
			x = safeZoneX + safeZoneW * 0.38625;
			y = safeZoneY + safeZoneH * 0.53777778;
			w = safeZoneW * 0.0925;
			h = safeZoneH * 0.03888889;
			text = "Pay";
			action = "[]call ticket_pay";
		};
		
	};
};

