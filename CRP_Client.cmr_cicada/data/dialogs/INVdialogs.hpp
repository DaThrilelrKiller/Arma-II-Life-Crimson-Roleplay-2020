class itemkaufdialog 

{

idd = -1;
movingEnable = true;
controlsBackground[] = {DLG_BACK1, DLG_BACK2, background1, background2};
objects[] = { };
controls[] = {itemliste, itemeingabe, submit, cancel, weight, cancel2, submit2, itemeingabe2, itemliste2, text_inventargeld, dummybutton};

	class DLG_BACK1: RscBackground

	{

	x = 0.02; y = 0.07;
	w = 0.46; h = 0.63;

	};

	class DLG_BACK2: RscBackground

	{

	x = 0.51; y = 0.07;
	w = 0.46; h = 0.63;

	};	

	class background1 : RscBgRahmen	

	{

	x = 0.02; y = 0.07;
	w = 0.46; h = 0.63;

	text = $STRD_inv_description_itemmenu_title;
	idc = 91;

	};

	class itemliste : RscListBox

	{

	idc = 1;
	x = 0.04; y = 0.10;
	w = 0.42; h = 0.48;

	};

	class itemeingabe : RscEdit

	{	

	idc = 2;
	x = 0.04; y = 0.60;
	w = 0.20; h = 0.04;

	text = "1";

	};

	class submit : RscButton

	{	

	idc = 3;
	x = 0.25; y = 0.60;
	w = 0.20; h = 0.04;

	};	

	class cancel : RscButton

	{

	x = 0.25; y = 0.65;
	w = 0.20; h = 0.04;

	text = $STRD_inv_description_buyitem_close;
	action = "closedialog 0";

	};

	class weight : RscText

	{

	idc = 765;
	x = 0.04; y = 0.65;
	w = 0.20; h = 0.04;

	};

	class background2 : RscBgRahmen

	{

	x = 0.51; y = 0.07;
	w = 0.46; h = 0.63;
	idc = 92;

	text = $STRD_inv_description_itemmenu_title2;

	};

	class cancel2 : RscButton

	{				

	x = 0.74; 
	y = 0.65;
	w = 0.20; 
	h = 0.04;

	text = $STRD_inv_description_buyitem_close;
	action = "closedialog 0;";

	};

	class submit2 : RscButton

	{

	idc = 103;
	x = 0.74; y = 0.60;
	w = 0.20; h = 0.04;

	};

	class itemeingabe2 : RscEdit

	{	

	idc = 102;
	x = 0.53; y = 0.60;
	w = 0.20; h = 0.04;
	text = "1";

	};

	class itemliste2 : RscListBox

	{

	idc = 101;
	w = 0.42; h = 0.48;
	x = 0.53; y = 0.10;

	};

	class text_inventargeld : RscText

	{	

	idc = 100;
	x = 0.04; y = 0.65;
	w = 0.20; h = 0.04;

	};

	class dummybutton : RscDummy {idc = 1015;};

};
	class INV_list
	{	
	idd = -1;		
	movingEnable = true;	
	controlsBackground[] = {DLG_BACK1, background};	
	objects[] = { };		
	controls[] = {liste, close, dummybutton};	
	class DLG_BACK1: RscBackground		
	{										
	x = 0.21; y = 0.05;						
	w = 0.52; h = 0.84;						
	};										
	class background : RscBgRahmen			
	{										
	x = 0.21; y = 0.05;					
	w = 0.52; h = 0.84;					
	text = "List";				
	};						
	class liste : RscListBox		
	{									
	idc = 1;							
	x = 0.22; y = 0.08;					
	w = 0.50; h = 0.73;					
	SizeEX = 0.0195; 					
	RowHeight = 0.03; 			
	};								
	class close : RscButton			
	{					
	idc = 2;					
	x = 0.39; y = 0.83;				
	w = 0.20; h = 0.04;				
	text = $STRD_inv_description_buyitem_close;	
	action = "closedialog 0;";						
	};		
	class dummybutton : RscDummy 
	{
	idc = 2017;
	};
	};
	
	

class shop_dialog 

{

idd = -1;
movingEnable = true;
controlsBackground[] = {DLG_BACK1, DLG_BACK2, background1, background2};
objects[] = { };
controls[] = {itemliste, itemeingabe, submit, cancel, weight, cancel2, submit2, itemeingabe2, itemliste2, text_inventargeld, dummybutton};

	class DLG_BACK1: RscBackground

	{

	x = 0.02; y = 0.07;
	w = 0.46; h = 0.63;

	};

	class DLG_BACK2: RscBackground

	{

	x = 0.51; y = 0.07;
	w = 0.46; h = 0.63;

	};	

	class background1 : RscBgRahmen	

	{

	x = 0.02; y = 0.07;
	w = 0.46; h = 0.63;

	text = $STRD_inv_description_itemmenu_title;
	idc = 91;

	};

	class itemliste : RscListBox

	{

	idc = 1;
	x = 0.04; y = 0.10;
	w = 0.42; h = 0.48;
	onLBSelChanged = "[_this,1] call shops_refresh;";
	};

	class itemeingabe : RscEdit

	{	

	idc = 2;
	x = 0.04; y = 0.60;
	w = 0.20; h = 0.04;

	text = "1";

	};

	class submit : RscButton

	{	

	idc = 3;
	x = 0.25; y = 0.60;
	w = 0.20; h = 0.04;

	};	

	class cancel : RscButton

	{

	x = 0.25; y = 0.65;
	w = 0.20; h = 0.04;

	text = $STRD_inv_description_buyitem_close;
	action = "closedialog 0";

	};

	class weight : RscText

	{

	idc = 765;
	x = 0.04; y = 0.65;
	w = 0.20; h = 0.04;

	};

	class background2 : RscBgRahmen

	{

	x = 0.51; y = 0.07;
	w = 0.46; h = 0.63;
	idc = 92;

	text = $STRD_inv_description_itemmenu_title2;

	};

	class cancel2 : RscButton

	{				

	x = 0.74; 
	y = 0.65;
	w = 0.20; 
	h = 0.04;

	text = $STRD_inv_description_buyitem_close;
	action = "closedialog 0;";

	};

	class submit2 : RscButton

	{

	idc = 103;
	x = 0.74; y = 0.60;
	w = 0.20; h = 0.04;

	};

	class itemeingabe2 : RscEdit

	{	

	idc = 102;
	x = 0.53; y = 0.60;
	w = 0.20; h = 0.04;
	text = "1";

	};

	class itemliste2 : RscListBox

	{

	idc = 101;
	w = 0.42; h = 0.48;
	x = 0.53; y = 0.10;
	onLBSelChanged = "[_this,101] call shops_refresh;";

	};

	class text_inventargeld : RscText

	{	

	idc = 100;
	x = 0.04; y = 0.65;
	w = 0.20; h = 0.04;

	};

	class dummybutton : RscDummy {idc = 1015;};

};