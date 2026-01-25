
class animationsdialog
{
	idd = -1;
	movingEnable = true;											
	controlsBackground[] = {DLG_BACK1, background};
	objects[] = { };
	controls[] = {animationsliste, submit, cancel, dummybutton};

	class DLG_BACK1: RscBackground
	{
			x = 0.29; y = 0.09;
			w = 0.43; h = 0.75;
	};
	class background : RscBgRahmen
	{
			x = 0.29; y = 0.09;
			w = 0.43; h = 0.75;
			text = "Select An Animation";
	};
	class animationsliste : RscListBox
	{
		idc = 1;
		x = 0.30; y = 0.12;
		w = 0.40; h = 0.65;
	};
	class submit : RscButton
	{
		idc = -1;
		x = 0.30; y = 0.78;
		w = 0.20; h = 0.04;
		text = "Submit";
		action = "[lbCurSel 1]call dance_play; closedialog 0;";
	};
	class cancel : RscButton
	{
		x = 0.51; y = 0.78;
		w = 0.20; h = 0.04;
		text = "$STRD_description_cancel";
		action = "closedialog 0;";
	};
		class dummybutton : RscDummy {idc = -1;
	};
};