
class ARMAT_CodePad_RscText
{
	type = 0;
	idc = -1;
	style = 0;
	colorBackground[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
	font = "Bitstream";
	sizeEx = 0.08;
	linespacing = 1.0;
};
class ARMAT_CodePad_RscPicture
{
	type = 0;
	idc = -1;
	style = 48;
	colorBackground[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
	font = "tahomaB";
	sizeEx = 0.04;
};
class ARMAT_CodePad_RscButton
{
	type = 1;
	idc = -1;
	style = 2;
	colorText[] = {0,0,0,1};
	colorDisabled[] = {0,0,0,0};
	colorBackground[] = {0,0,0,0};
	colorBackgroundDisabled[] = {0,0,0,0};
	colorBackgroundActive[] = {0,0,0,0};
	colorFocused[] = {0,0,0,0};
	colorShadow[] = {0,0,0,0};
	colorBorder[] = {0,0,0,0};
	borderSize = 0.008;
	offsetX = 0.004;
	offsetY = 0.004;
	offsetPressedX = 0.002;
	offsetPressedY = 0.002;
	font = "tahomab";
	sizeEx = 0.025;
	soundEnter[] = {"",0.1,1};
	soundPush[] = {"",0.2,1};
	soundClick[] = {"\cl_audio\ui_ok",0.2,1};
	soundEscape[] = {"\cl_audio\ui_cc",0.2,1};
	default = "false";
};

class ARMAT1_CodePad
{
	idd = 182173;
	movingEnable = "true";
	controlsBackground[] = {"CodePadBack","Codepadfrrame"};
	objects[] = {};
	controls[] = {"CODEPAD","led_green","led_red","display","digit7","digit8","digit9","digit4","digit5","digit6","digit1","digit2","digit3","digit0","digit_R","digit_X"};
	onLoad = "";
	class CodePadBack: ARMAT_CodePad_RscText
	{
		colorBackground[] = {0.4,0.4,0.4,1};
		text = "";
		x = 0.375;
		y = 0.25;
		w = 0.2;
		h = 0.4;
	};
	class Codepadfrrame: ARMAT_CodePad_RscText
	{
		x = 0.34;
		y = 0.25;
		idc = -1;
		w = 0.2;
		h = 0.4;
		style = 64;
		colorText[] = {0,0,0,0};
		colorBackground[] = {1,1,1,0};
		SizeEX = 0.025;
		text = "";
	};
	class display: ARMAT_CodePad_RscText
	{
		x = 0.382;
		y = 0.5006;
		idc = 999;
		w = 0.19;
		h = 0.04;
		style = 2;
		text = "";
		colorText[] = {0.0,0.9,0.0,0.65};
		font = "LucidaConsoleB";
		SizeEX = 0.038;
		colorSelect[] = {0,0,0,0};
	};
	class digit7: ARMAT_CodePad_RscButton
	{
		x = 0.427;
		y = 0.612;
		idc = 107;
		w = 0.025;
		h = 0.035;
		style = 2;
		colorText[] = {0,0,0,1};
		font = "LucidaConsoleB";
		SizeEX = 0.02;
		text = "7";
		action = "7 call codepad_button;";
		default = "false";
	};
	class digit8: ARMAT_CodePad_RscButton
	{
		x = 0.467;
		y = 0.612;
		idc = 108;
		w = 0.025;
		h = 0.035;
		style = 2;
		colorText[] = {0,0,0,1};
		font = "LucidaConsoleB";
		SizeEX = 0.02;
		text = "8";
		action = "8 call codepad_button;";
		default = "false";
	};
	class digit9: ARMAT_CodePad_RscButton
	{
		x = 0.506;
		y = 0.612;
		idc = 109;
		w = 0.025;
		h = 0.035;
		style = 2;
		colorText[] = {0,0,0,1};
		font = "LucidaConsoleB";
		SizeEX = 0.02;
		text = "9";
		action = "9 call codepad_button;";
		default = "false";
	};
	class digit4: ARMAT_CodePad_RscButton
	{
		x = 0.427;
		y = 0.659;
		idc = 104;
		w = 0.025;
		h = 0.035;
		style = 2;
		colorText[] = {0,0,0,1};
		font = "LucidaConsoleB";
		SizeEX = 0.02;
		text = "4";
		action = "4 call codepad_button;";
		default = "false";
	};
	class digit5: ARMAT_CodePad_RscButton
	{
		x = 0.467;
		y = 0.659;
		idc = 105;
		w = 0.025;
		h = 0.035;
		style = 2;
		colorText[] = {0,0,0,1};
		font = "LucidaConsoleB";
		SizeEX = 0.02;
		text = "5";
		action = "5 call codepad_button;";
		default = "false";
	};
	class digit6: ARMAT_CodePad_RscButton
	{
		x = 0.506;
		y = 0.659;
		idc = 106;
		w = 0.025;
		h = 0.035;
		style = 2;
		colorText[] = {0,0,0,1};
		font = "LucidaConsoleB";
		SizeEX = 0.02;
		text = "6";
		action = "6 call codepad_button;";
		default = "false";
	};
	class digit1: ARMAT_CodePad_RscButton
	{
		x = 0.427;
		y = 0.707;
		idc = 101;
		w = 0.025;
		h = 0.035;
		style = 2;
		colorText[] = {0,0,0,1};
		font = "LucidaConsoleB";
		SizeEX = 0.02;
		text = "1";
		action = "1 call codepad_button;";
		default = "false";
	};
	class digit2: ARMAT_CodePad_RscButton
	{
		x = 0.467;
		y = 0.707;
		idc = 102;
		w = 0.025;
		h = 0.035;
		style = 2;
		colorText[] = {0,0,0,1};
		font = "LucidaConsoleB";
		SizeEX = 0.02;
		text = "2";
		action = "2 call codepad_button;";
		default = "false";
	};
	class digit3: ARMAT_CodePad_RscButton
	{
		x = 0.506;
		y = 0.707;
		idc = 103;
		w = 0.025;
		h = 0.035;
		style = 2;
		colorText[] = {0,0,0,1};
		font = "LucidaConsoleB";
		SizeEX = 0.02;
		text = "3";
		action = "3 call codepad_button;";
		default = "false";
	};
	class digit0: ARMAT_CodePad_RscButton
	{
		x = 0.467;
		y = 0.755;
		idc = 100;
		w = 0.025;
		h = 0.035;
		style = 2;
		colorText[] = {0,0,0,1};
		font = "LucidaConsoleB";
		SizeEX = 0.02;
		text = "0";
		action = "0 call codepad_button;";
		default = "false";
	};
	class digit_X: ARMAT_CodePad_RscButton
	{
		x = 0.428;
		y = 0.756;
		idc = 110;
		w = 0.025;
		h = 0.035;
		style = 2;
		colorText[] = {0,0,0,1};
		font = "LucidaConsoleB";
		SizeEX = 0.02;
		text = "*";
		action = "";
		default = "false";
	};
	class digit_R: ARMAT_CodePad_RscButton
	{
		x = 0.505;
		y = 0.755;
		idc = 111;
		w = 0.025;
		h = 0.035;
		style = 2;
		colorText[] = {0,0,0,1};
		font = "LucidaConsoleB";
		SizeEX = 0.02;
		text = "#";
		action = "";
		default = "false";
	};
	class CODEPAD: ARMAT_CodePad_RscPicture
	{
		idc = 501;
		text = "\ArMaT_Jail2\Pics\codepad.paa";
		x = 0.343;
		y = 0.228;
		w = 0.27;
		h = 0.654;
	};
	class led_green: ARMAT_CodePad_RscPicture
	{
		idc = 598;
		text = "\ArMaT_Jail2\Pics\led_green.paa";
		x = 0.39;
		y = 0.452;
		w = 0.02;
		h = 0.024;
	};
	class led_red: ARMAT_CodePad_RscPicture
	{
		idc = 597;
		text = "\ArMaT_Jail2\Pics\led_red.paa";
		x = 0.555;
		y = 0.452;
		w = 0.02;
		h = 0.024;
	};
};