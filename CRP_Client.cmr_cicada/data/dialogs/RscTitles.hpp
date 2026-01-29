

class Rtags
{
	idd=64431;
	movingEnable = true;
	fadein       =  0;
	fadeout      =  0;
	duration     =  0.1;
	name="TAGS_HUD";
	controls[]={"interact"};
	onLoad="uiNamespace setVariable ['TAGS_HUD', _this select 0]";

	class interact
	{
		type = CT_STRUCTURED_TEXT;
		idc = 64438;
		style = 0;
		x = 0.50;
		y = 0.47;
		w = 0.3;
		h = 0.2;
		font = "Zeppelin33Italic";
		sizeEx = 0.045;
		size = 0.045;
		colorText[] = {1, 1, 1, 1};
		colorBackground[]={0,0,0,0.0};
		text = "";
	};

};