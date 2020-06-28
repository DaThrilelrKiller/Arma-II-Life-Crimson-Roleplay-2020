class schluessel
{
idd = -1;
movingEnable = true;
controlsBackground[] = {background};
objects[] = { };	
controls[] = {schluesselliste, submit, submit2, cancel, button_wegwerfen, dummybutton};
class background : RscBackground
{
x = 0.34; y = 0.11;w = 0.33; h = 0.81;
};	
class schluesselliste : RscListBox
{
idc = 1;
x = 0.35; y = 0.14;w = 0.31; h = 0.54;
style = ST_CENTER;	
};	
class submit : RscButton
{
idc = 56;	
x = 0.35; y = 0.70;w = 0.31; h = 0.04;
text = $STRD_inv_description_inventar_use;
action = "[]call keys_lock";
};
class submit2 : RscButton
{
idc = 5;	
x = 0.35; y = 0.75;w = 0.31; h = 0.04;
text = $STRD_inv_description_inventar_schluessel_uebergabe;
action = "";
};
class cancel : RscButton
{
idc = 3;
x = 0.35; y = 0.80;w = 0.31; h = 0.04;
text = $STRD_description_cancel;
action = "closedialog 0";	
};
class button_wegwerfen : RscButton
{
	idc = 4;
	x =0.35; y = 0.86;w = 0.31; h = 0.04;
	text = $STRD_inv_description_inventar_drop;
	action = "(lbData [1, (lbCurSel 1)])call keys_drop";
};
class dummybutton : RscDummy 
{
idc = 1013;
};
};

