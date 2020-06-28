class map_dialog
{
	idd = 186;
	movingEnable = true;
	objects[] = {};
	
	class controlsBackground 
	{
		class Map : dtkMap 
		{ 
			idc = 0; 
			type = CT_MAP_MAIN; 
			style = ST_PICTURE; 
			x = safezoneX;
			y = safezoneY;
			w = safezoneW;
			h = safezoneH;
		};	
	};
	
	class controls
	{
		class text_1:RLRPG_MainHUD_RscText
		{
			idc = 1;
			type = CT_STRUCTURED_TEXT;
			size = 0.031;
			x = 0;
			y = 0;
			w = safeZoneW * 0.35875;
			h = safeZoneH * 0.5;
			font = "EtelkaNarrowMediumPro";
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			text = "";
			shadow = 2;
			align = "left";
			valign = "bottom";
				
			class Attributes {
				align = "left";
				valign = "bottom";
			};
		};
		class text_2 : text_1 {
			idc = 2;
		};
		class text_3 : text_1 {
			idc = 3;
		};
		class text_4 : text_1 {
			idc = 4;
		};
		class text_5 : text_1 {
			idc = 5;
		};
		class text_6 : text_1 {
			idc = 6;
		};
		class text_7 : text_1 {
			idc = 7;
		};
		class text_8 : text_1 {
			idc = 8;
		};
		class text_9 : text_1 {
			idc = 9;
		};
		class text_10 : text_1 {
			idc = 10;
		};
		class text_11 : text_1 {
			idc = 11;
		};
		class text_12 : text_1 {
			idc = 12;
		};
		class text_13 : text_1 {
			idc = 13;
		};
		class text_14 : text_1 {
			idc = 14;
		};
		class text_15 : text_1 {
			idc = 15;
		};
		class text_16 : text_1 {
			idc = 16;
		};
		class text_17 : text_1 {
			idc = 17;
		};
		class text_18 : text_1 {
			idc = 18;
		};
		class text_19 : text_1 {
			idc = 19;
		};
		class text_20 : text_1 {
			idc = 20;
		};
		class text_21 : text_1 {
			idc = 21;
		};
		class text_22 : text_1 {
			idc = 22;
		};
		class text_23 : text_1 {
			idc = 23;
		};
		class text_24 : text_1 {
			idc = 24;
		};
		class text_25 : text_1 {
			idc = 25;
		};
		class text_26 : text_1 {
			idc = 26;
		};
		class text_27 : text_1 {
			idc = 27;
		};
		class text_28 : text_1 {
			idc = 28;
		};
		class text_29 : text_1 {
			idc = 29;
		};
		class text_30 : text_1 {
			idc = 30;
		};
		class text_31 : text_1 {
			idc = 31;
		};
		class text_32 : text_1 {
			idc = 32;
		};
		class text_33 : text_1 {
			idc = 33;
		};
		class text_34 : text_1 {
			idc = 34;
		};
		class text_35 : text_1 {
			idc = 35;
		};
		class text_36 : text_1 {
			idc = 36;
		};
		class text_37 : text_1 {
			idc = 37;
		};
		class text_38 : text_1 {
			idc = 38;
		};
		class text_39 : text_1 {
			idc = 39;
		};
		class text_40 : text_1 {
			idc = 40;
		};
		class text_41 : text_1 {
			idc = 41;
		};
		class text_42 : text_1 {
			idc = 42;
		};
		class text_43 : text_1 {
			idc = 43;
		};
		class text_44 : text_1 {
			idc = 44;
		};
		class text_45 : text_1 {
			idc = 45;
		};
		class text_46 : text_1 {
			idc = 46;
		};
		class text_47 : text_1 {
			idc = 47;
		};
		class text_48 : text_1 {
			idc = 48;
		};
		class text_49 : text_1 {
			idc = 49;
		};
		class text_50 : text_1 {
			idc = 50;
		};
		class text_51 : text_1 {
			idc = 51;
		};
		class text_52 : text_1 {
			idc = 52;
		};
		class text_53 : text_1 {
			idc = 53;
		};
		class text_54 : text_1 {
			idc = 54;
		};
		class text_56 : text_1 {
			idc = 56;
		};
		class text_57 : text_1 {
			idc = 57;
		};
		class text_58 : text_1 {
			idc = 58;
		};
		class text_59 : text_1 {
			idc = 59;
		};
		class text_60 : text_1 {
			idc = 60;
		};
		class text_61 : text_1 {
			idc = 61;
		};
		class text_62 : text_1 {
			idc = 62;
		};
		class text_63 : text_1 {
			idc = 63;
		};
		class text_64 : text_1 {
			idc = 64;
		};
		class text_65 : text_1 {
			idc = 65;
		};
		class text_66 : text_1 {
			idc = 66;
		};
		class text_67 : text_1 {
			idc = 67;
		};
		class text_68 : text_1 {
			idc = 68;
		};
		class text_69 : text_1 {
			idc = 69;
		};
		class text_70 : text_1 {
			idc = 70;
		};
		class text_71 : text_1 {
			idc = 71;
		};
		class text_72 : text_1 {
			idc = 72;
		};
		class text_73 : text_1 {
			idc = 73;
		};
		class text_74 : text_1 {
			idc = 74;
		};
		class text_75 : text_1 {
			idc = 75;
		};
		class text_76 : text_1 {
			idc = 76;
		};
		class text_77 : text_1 {
			idc = 77;
		};
		class text_78 : text_1 {
			idc = 78;
		};
		class text_79 : text_1 {
			idc = 79;
		};
		class text_80 : text_1 {
			idc = 80;
		};
		class text_81 : text_1 {
			idc = 81;
		};
		class text_82 : text_1 {
			idc = 82;
		};
		class text_83 : text_1 {
			idc = 83;
		};
		class text_84 : text_1 {
			idc = 84;
		};
		class text_85 : text_1 {
			idc = 85;
		};
		class text_86 : text_1 {
			idc = 86;
		};
		class text_87 : text_1 {
			idc = 87;
		};
		class text_88 : text_1 {
			idc = 88;
		};
		class text_89 : text_1 {
			idc = 89;
		};
		class text_90 : text_1 {
			idc = 90;
		};
		class text_91 : text_1 {
			idc = 91;
		};
		class text_92 : text_1 {
			idc = 92;
		};
		class text_93 : text_1 {
			idc = 93;
		};
		class text_94 : text_1 {
			idc = 94;
		};
		class text_95 : text_1 {
			idc = 95;
		};
		class text_96 : text_1 {
			idc = 96;
		};
		class text_97 : text_1 {
			idc = 97;
		};
		class text_98 : text_1 {
			idc = 98;
		};
		class text_99 : text_1 {
			idc = 99;
		};
		class text_100 : text_1 {
			idc = 100;
		};
	};		
};