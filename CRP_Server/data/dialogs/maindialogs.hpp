class baildialog
{
	idd = -1;
	movingEnable = true;
	controlsBackground[] = {DLG_BACK1, background};
	objects[] = { };		
	controls[] = {button_paybail, bail_eingabe, cancel, dummybutton};	
	
	class DLG_BACK1: RscBackground	
	{						
		x = 0.38; 
		y = 0.25;	
		w = 0.42; 
		h = 0.22;	
	};
	
	class background : RscBgRahmen		
	{
		x = 0.38;
		y = 0.25;	
		w = 0.42;
		h = 0.22;		
		
		text = $STRD_description_bail_pay;		
	};
	
	class button_paybail : RscButton	
	{
		x = 0.45; 
		y = 0.35;		
		w = 0.25;
		h = 0.04;	
		
		text = $STRD_description_bail_pay;	
		action = "[ctrlText 2]call Jail_PayBail; CloseDialog 0;";		
	};
	
	class cancel : RscButton	
	{
		x = 0.45;
		y = 0.40;		
		w = 0.25;
		h = 0.04;	
		
		text = $STRD_description_cancel;
		action = "closedialog 0";	
	};
	
	class bail_eingabe : RscEdit	
	{
		x = 0.45;
		y = 0.30;
		w = 0.24;
		h = 0.04;
		idc = 2;
		text = "1000";
	};
	
	class dummybutton : RscDummy 
	{
		idc = 1008;
	};
};

class liste_1_button
{
	idd = -1;
	movingEnable = true;
	controlsBackground[] = {DLG_BACK1, background};	
	objects[] = { };		
	controls[] = {spielerliste, closeabc, dummybutton};	
	
	class DLG_BACK1: RscBackground	
	{
		x = 0.21;
		y = 0.05;	
		w = 0.52; 
		h = 0.84;
	};
	
	class background : RscBgRahmen		
	{
		x = 0.21;
		y = 0.05;	
		w = 0.52;
		h = 0.84;
		
		text = $STRD_description_spielerliste_header;
	};
	
	class spielerliste : RscListBox	
	{
		idc = 1;
		x = 0.22;
		y = 0.08;	
		w = 0.50;
		h = 0.73;	
		SizeEX = 0.0195; 
		RowHeight = 0.03; 	
	};

	class closeabc : RscButton	
	{		
		idc = 221;		
		x = 0.39; 
		y = 0.83;	
		w = 0.20;
		h = 0.04;
		
		text = $STRD_description_buyitem_close;	
	};
	
	class dummybutton : RscDummy 
	{
		idc = 1017;
	};
};

class lawsdialog
{
	idd = 7700;
	movingEnable = true;
	controlsBackground[] = {DLG_BACK1, background};
	objects[] = { };
	controls[] = {title, governorLabel, lawsHeader, lawsList, lawPreview, taxesHeader, taxesList, closeBtn, dummybutton};

	class DLG_BACK1: RscBackground
	{
		x = 0.15;
		y = 0.10;
		w = 0.70;
		h = 0.80;
	};

	class background : RscBgRahmen
	{
		x = 0.15;
		y = 0.10;
		w = 0.70;
		h = 0.80;
		text = "County Government";
	};

	class title : D_RscTextTitle
	{
		idc = 900;
		x = 0.17;
		y = 0.12;
		w = 0.66;
		h = 0.04;
		text = "Laws & Taxes";
	};

	class governorLabel : RscText
	{
		idc = 901;
		x = 0.17;
		y = 0.165;
		w = 0.66;
		h = 0.03;
		text = "Mayor (Governor):";
	};

	class lawsHeader : RscText
	{
		idc = -1;
		x = 0.17;
		y = 0.205;
		w = 0.33;
		h = 0.03;
		text = "Laws";
	};

	class lawsList : RscListBox
	{
		idc = 910;
		x = 0.17;
		y = 0.235;
		w = 0.33;
		h = 0.48;
		SizeEX = 0.0195;
		RowHeight = 0.03;
	};

	class lawPreview : RscStructuredText
	{
		idc = 911;
		x = 0.17;
		y = 0.725;
		w = 0.66;
		h = 0.08;
		colorText[] = {1,1,1,1};
		text = "";
	};

	class taxesHeader : RscText
	{
		idc = -1;
		x = 0.52;
		y = 0.205;
		w = 0.31;
		h = 0.03;
		text = "Taxes";
	};

	class taxesList : RscListBox
	{
		idc = 920;
		x = 0.52;
		y = 0.235;
		w = 0.31;
		h = 0.48;
		SizeEX = 0.0195;
		RowHeight = 0.03;
	};

	class closeBtn : RscButton
	{
		idc = 921;
		x = 0.65;
		y = 0.82;
		w = 0.18;
		h = 0.04;
		text = "Close";
		action = "closeDialog 0;";
	};

	class dummybutton : RscDummy
	{
		idc = 9099;
	};
};

class gesetzdialog
{
	idd = -1;
	movingEnable = true;
	controlsBackground[] = {DLG_BACK1, background};
	objects[] = { };
	controls[] = {gesetzliste, eingabefenster, submit, closeBtn, charCount, helpText, dummybutton};	
	
	class DLG_BACK1: RscBackground	
	{
		x = 0.03; 
		y = 0.21;	
		w = 0.93;
		h = 0.43;
	};
	
	class background : RscBgRahmen				
	{
		x = 0.03;
		y = 0.21;
		w = 0.93;
		h = 0.43;
		
		text = $STRD_dialogandere_gesetze_header;
	};
	
	class gesetzliste : RscListBox		
	{
		idc = 1;		
		x = 0.04; 
		y = 0.24;
		w = 0.55; 
		h = 0.34;	
		SizeEX = 0.0195;
		RowHeight = 0.03;
	};
	
	class eingabefenster : RscEdit	
	{
		idc = 2;
		x = 0.60; 
		y = 0.58;
		w = 0.35; 
		h = 0.04;
		
		onChar = "[_this, 1] call TastenDruck;";
	};
	
	class submit : RscButton
	{
		x = 0.60;
		y = 0.58;
		w = 0.17; 
		h = 0.04;	
		idc = 3;

		text = $STRD_dialogandere_gesetze_submit;	
		action = "[0,0,0,[""clientgesetz"", lbcursel 1, Ctrltext 2]] execVM ""scripts\mayor.sqf""; closedialog 0;";	
	};	

	class closeBtn : RscButton
	{
		x = 0.78;
		y = 0.58;
		w = 0.17;
		h = 0.04;
		text = $STRD_description_buyitem_close;
		action = "closeDialog 0;";
	};

	class charCount : RscText
	{
		idc = 4;
		x = 0.60;
		y = 0.54;
		w = 0.35;
		h = 0.03;
		text = "0 / 60";
	};

	class helpText : RscText
	{
		idc = -1;
		x = 0.60;
		y = 0.24;
		w = 0.35;
		h = 0.30;
		text = "Select a law on the left, edit it here.\nKeep it short and clear (max 60).";
	};
	
	class dummybutton : RscDummy 
	{
		idc = 1020;
	};
};

class wahldialog
{
	idd = -1;	
	movingEnable = true;
	controlsBackground[] = {DLG_BACK1, background};	
	objects[] = { };
	controls[] = {spielerliste, submit, cancel, dummybutton};	
	
	class DLG_BACK1: RscBackground		
	{	
		x = 0.36;
		y = 0.06;
		w = 0.30; 
		h = 0.80;
	};		
	
	class background : RscBgRahmen
	{		
		x = 0.36; 
		y = 0.06;	
		w = 0.30;
		h = 0.80;
		
		text = $STRD_description_wahl_header;
	};
	
	class spielerliste : RscListBox
	{
		x = 0.38;
		y = 0.09;
		w = 0.27; 
		h = 0.61;
		idc = 1;
		onLBSelChanged = "_this call goverment_lbChanged";
	};			
	
	class submit : RscButton	
	{
		idc = 67;
		x = 0.42; 
		y = 0.72;
		w = 0.20;
		h = 0.04;
		
		text = $STRD_description_wahl_submit;
		action = "call goverment_submit";
	};
	
	class cancel : RscButton		
	{							
		x = 0.42; 
		y = 0.79;
		w = 0.20; 
		h = 0.04;
		
		text = $STRD_description_buyitem_close;
		action = "closedialog 0;";		
	};
	
	class dummybutton : RscDummy 
	{
		idc = 1031;
	};
};

class steuerdialog
{
	idd = -1;	
	movingEnable = true;
	controlsBackground[] = {DLG_BACK1, background};		
	objects[] = { };	
	controls[] = {text_itemsteuer, slider_itemsteuer, fahrzeugsteuer_text, fahrzeugsteuer_slider, magazinsteuer_text, magazinsteuer_slider, waffesteuer_text, waffesteuer_slider, banksteuer_text, banksteuer_slider, button_submit, button_cancel, dummybutton};	
	
	class DLG_BACK1: RscBackground		
	{						
		x = 0.34;
		y = 0.08;	
		w = 0.28; 
		h = 0.70;	
	};		

	class background : RscBgRahmen	
	{								
		x = 0.34; 
		y = 0.08;	
		w = 0.28; 
		h = 0.70;	
		
		text = $STRD_description_steuer_header;	
	};		
	
	class text_itemsteuer : RscText	
	{				
		x = 0.35;
		y = 0.12;	
		w = 0.26; 
		h = 0.04;
		idc = 11;
	};			
	
	class slider_itemsteuer : RscSliderH
	{							
		idc = 12;
		x = 0.35; 
		y = 0.17;	
		w = 0.26; 
		h = 0.04;
	};			
	
	class fahrzeugsteuer_text : RscText		
	{							
		idc = 21;		
		x = 0.35;
		y = 0.23;
		w = 0.26; 
		h = 0.04;
	};			
	
	class fahrzeugsteuer_slider : RscSliderH
	{								
		idc = 22;
		x = 0.35; 
		y = 0.28;
		w = 0.26; 
		h = 0.04;
	};
	
	class magazinsteuer_text : RscText
	{									
		idc = 31;	
		x = 0.35; 
		y = 0.34;
		w = 0.26; 
		h = 0.04;
	};			
	
	class magazinsteuer_slider : RscSliderH
	{						
		idc = 32;		
		x = 0.35; 
		y = 0.39;
		w = 0.26; 
		h = 0.04;
	};		
	
	class waffesteuer_text : RscText		
	{					
		idc = 41;		
		x = 0.35;
		y = 0.45;		
		w = 0.26;
		h = 0.04;		
	};	
	
	class waffesteuer_slider : RscSliderH	
	{		
		idc = 42;	
		x = 0.35; 
		y = 0.50;	
		w = 0.26; 
		h = 0.04;	
	};		
	
	class banksteuer_text : RscText	
	{					
		idc = 51;	
		x = 0.35; 
		y = 0.56;
		w = 0.25; 
		h = 0.04;
	};		
	
	class banksteuer_slider : RscSliderH
	{						
		idc = 52;		
		x = 0.35; 
		y = 0.61;
		w = 0.25; 
		h = 0.04;
	};				
	
	class button_submit : RscButton	
	{							
		x = 0.38; 
		y = 0.67;
		w = 0.20; 
		h = 0.04;
		
		text = $STRD_description_steuer_submit;
		action = "[0,1,2,[""steuernMayor"", (round(sliderPosition 12)), (round(sliderPosition 32)), (round(sliderPosition 42)), (round(sliderPosition 22)), (round(sliderPosition 52))]] execVM ""scripts\mayor.sqf""; closedialog 0;";	
	};
	
	class button_cancel : RscButton	
	{	
		x = 0.38; 
		y = 0.72;		
		w = 0.20;
		h = 0.04;

		text = $STRD_description_buyitem_close;	
		action = "closedialog 0;";			
	};						
	
	class dummybutton : RscDummy 
	{
		idc = 1032;
	};
};