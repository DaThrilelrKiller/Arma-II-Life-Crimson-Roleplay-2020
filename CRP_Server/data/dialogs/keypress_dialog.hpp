class keypress_dialog
{
	idd = 154;
	movingEnable = true;
	objects[] = {};
	onLoad = "";
	onUnload = "";
	class controls
	{	
		class RscPicture_1200: RscBackground
		{
			idc = 33363;
			text = "";
			x = 0.261366;
			y = 0.00479847;
			w = 0.5;
			h = 1;
		};
		class RscPicture_1201: Rsc_lable
		{
			idc = 1201;
			text = "";
			x = 0.261838;
			y = 3.89758e-007;
			w = 0.5;
			h = 0.075;
		};
		class list: RscListBox
		{
			idc = 1401;

			x = 0.288829;
			y = 0.105556;
			w = 0.422349;
			h = 0.424495;
			onLBSelChanged = "[]call keypress_refresh;";
		};
		class selectKey: RscCombo
		{
			idc = 2100;
			x = 0.515624;
			y = 0.575;
			w = 0.1875;
			h = 0.05;
		};
		class selectShift: RscCombo
		{
			idc = 2101;
			x = 0.515624;
			y = 0.65;
			w = 0.1875;
			h = 0.05;
		};
		class selectCtrl: RscCombo
		{
			idc = 2102;
			x = 0.515624;
			y = 0.725;
			w = 0.1875;
			h = 0.05;
		};
		class selectAlt: RscCombo
		{
			idc = 2103;
			x = 0.515624;
			y = 0.8;
			w = 0.1875;
			h = 0.05;
		};
		class lableKeys: RscText
		{
			idc = 1001;
			text = "Key:";
			x = 0.390626;
			y = 0.55;
			w = 0.1;
			h = 0.1;
			colorText[] = {0.5098,0.0000,0.0000,1.0000};
		};
		class lableShift: RscText
		{
			idc = 1002;
			text = "Shift:";
			x = 0.375001;
			y = 0.625;
			w = 0.1;
			h = 0.1;
		};
		class lablectrl: RscText
		{
			idc = 1003;
			text = "Ctrl:";
			x = 0.390626;
			y = 0.7;
			w = 0.1;
			h = 0.1;
		};
		class lablealt: RscText
		{
			idc = 1004;
			text = "Alt:";
			x = 0.390626;
			y = 0.775;
			w = 0.1;
			h = 0.1;
		};
		class btnSave: RscButton
		{
			idc = 1600;
			text = "Save";
			x = 0.328126;
			y = 0.9;
			w = 0.164394;
			h = 0.0747475;
			action = "call keypress_update";
		};
		class BtnReset: RscButton
		{
			idc = 1601;
			text = "Reset All";
			action = "profileNamespace setVariable ['SFGKeys123',keybindingDefaults];";
			x = 0.515624;
			y = 0.9;
			w = 0.164394;
			h = 0.0747475;
		};
	};
};