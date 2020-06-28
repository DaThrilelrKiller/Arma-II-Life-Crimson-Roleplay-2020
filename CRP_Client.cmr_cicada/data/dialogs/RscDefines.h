#define armat_jailsoundloc []
#define FontM 			"Zeppelin32"
#define FontHTML 		"Zeppelin32"
#define CT_STATIC 		0
#define CT_BUTTON		1
#define CT_EDIT			2
#define CT_SLIDER		3
#define CT_COMBO		4
#define CT_LISTBOX		5
#define CT_TOOLBOX 		6
#define CT_CHECKBOXES 		7
#define CT_PROGRESS 		8
#define CT_HTML 		9
#define CT_STATIC_SKEW 		10
#define CT_ACTIVETEXT		11
#define CT_TREE 		12
#define CT_STRUCTURED_TEXT 	13
#define CT_CONTEXT_MENU 	14
#define CT_CONTROLS_GROUP 	15
#define CT_XKEYDESC 		40
#define CT_XBUTTON 		41
#define CT_XLISTBOX 		42
#define CT_XSLIDER 		43
#define CT_XCOMBO 		44
#define CT_ANIMATED_TEXTURE	45
#define CT_OBJECT 		80
#define CT_OBJECT_ZOOM 		81
#define CT_OBJECT_CONTAINER	82
#define CT_OBJECT_CONT_ANIM	83
#define CT_LINEBREAK		98
#define CT_USER			99
#define CT_MAP 			100
#define CT_MAP_MAIN		101


#define ST_LEFT			0
#define ST_RIGHT		1
#define ST_CENTER		2
#define ST_MULTI		16
#define ST_PICTURE		48
#define ST_FRAME		64
#define ST_SHADOW		256
#define ST_NO_RECT		512
#define ST_POS 0x0F 
#define ST_HPOS 0x03 
#define ST_VPOS 0x0C 
#define ST_DOWN 0x04 
#define ST_UP 0x08 
#define ST_VCENTER 0x0c 
#define ST_TYPE 0xF0 
#define ST_SINGLE 0 
#define ST_TITLE_BAR 32 
#define ST_BACKGROUND 80 
#define ST_GROUP_BOX 96 
#define ST_GROUP_BOX2 112 
#define ST_HUD_BACKGROUND 128 
#define ST_TILE_PICTURE 144 
#define ST_WITH_RECT 160 
#define ST_LINE 176 
#define ST_KEEP_ASPECT_RATIO 0x800 
#define ST_TITLE ST_TITLE_BAR + ST_CENTER 

#define SL_DIR 0x400 
#define SL_VERT 0 
#define SL_HORZ 0x400 
#define SL_TEXTURES 0x10 

#define LB_TEXTURES 0x10 
#define LB_MULTI 0x20 
#define true 1
#define false 1


class RLRPG_MainHUD_RscText {
	idc = -1;
	type = CT_STRUCTURED_TEXT;
	style = ST_LEFT;
	colorBackground[] = { 1 , 1 , 1 , 0 };
	colorText[] = { 1 , 1 , 1 , 1 };
	font = FontM;
	sizeEx = 0.025;
	h = 0.25;
	text = "";
};
class DD_RscText
{
	type = 0;
	idc = -1;
	colorBackground[] = {0,0,0,0};
	colorText[] = {0.8784,0.8471,0.651,1};
	text = "";
	fixedWidth = 0;
	x = 0;
	y = 0;
	h = 0.037;
	w = 0.3;
	style = 0;
	shadow = 2;
	font = "Zeppelin32";
	SizeEx = 0.03921;
};
class IGUIBack
{
	type = 0;
	idc = 124;
	style = 128;
	text = "";
	colorText[] = 
	{
		0,
		0,
		0,
		0
	};
	font = "default";
	sizeEx = 0;
	shadow = 0;
	x = 0.1;
	y = 0.1;
	w = 0.1;
	h = 0.1;
	colorbackground[] = 
	{
		"(profilenamespace getvariable ['IGUI_BCG_RGB_R',0])",
		"(profilenamespace getvariable ['IGUI_BCG_RGB_G',1])",
		"(profilenamespace getvariable ['IGUI_BCG_RGB_B',1])",
		"(profilenamespace getvariable ['IGUI_BCG_RGB_A',0.8])"
	};
};
class RscFrame
{
  type = CT_STATIC;
  idc = -1;
  style = ST_FRAME;

  x = 0.0;
  y = 0.0;
  w = 1.0;
  h = 1.0;
  sizeEx = Dlg_TEXTHGT;
  
  colorBackground[] = {Dlg_ColorScheme_Red, 1}; 
  colorText[] = {Dlg_ColorScheme_Yellow, 1}; 
  font = FontM_R;

  text = "";
};
class RscShortcutButton 
{
	type = 16;
	idc = -1;
	style = 0;
	default = 0;
	w = 0.183825;
	h = 0.104575;
	color[] = {0.543, 0.5742, 0.4102, 1.0};
	color2[] = {0.95, 0.95, 0.95, 1};
	colorBackground[] = {1, 1, 1, 1};
	colorbackground2[] = {1, 1, 1, 0.4};
	colorDisabled[] = {1, 1, 1, 0.25};
	periodFocus = 1.2;
	periodOver = 0.8;

	class HitZone {
		left = 0.004;
		top = 0.029;
		right = 0.004;
		bottom = 0.029;
	};

	class ShortcutPos {
		left = 0.004;
		top = 0.026;
		w = 0.0392157;
		h = 0.0522876;
	};

	class TextPos {
		left = 0.05;
		top = 0.034;
		right = 0.005;
		bottom = 0.005;
	};
	animTextureNormal = "\ca\ui\data\ui_button_normal_ca.paa";
	animTextureDisabled = "\ca\ui\data\ui_button_disabled_ca.paa";
	animTextureOver = "\ca\ui\data\ui_button_over_ca.paa";
	animTextureFocused = "\ca\ui\data\ui_button_focus_ca.paa";
	animTexturePressed = "\ca\ui\data\ui_button_down_ca.paa";
	animTextureDefault = "\ca\ui\data\ui_button_default_ca.paa";
	textureNoShortcut = "";
	period = 0.4;
	font = "Zeppelin32";
	size = 0.03521;
	sizeEx = 0.03521;
	text = "";
	soundEnter[] = {"\ca\ui\data\sound\mouse2", 0.09, 1};
	soundPush[] = {"\ca\ui\data\sound\new1", 0.09, 1};
	soundClick[] = {"\ca\ui\data\sound\mouse3", 0.07, 1};
	soundEscape[] = {"\ca\ui\data\sound\mouse1", 0.09, 1};
	action = "";

	class Attributes {
		font = "Zeppelin32";
		color = "#E5E5E5";
		align = "left";
		shadow = true;
	};

	class AttributesImage {
		font = "Zeppelin32";
		color = "#E5E5E5";
		align = "left";
	};
};
class RscStructuredText
{
	type = CT_STRUCTURED_TEXT;
	idc = -1;
	style = ST_LEFT;

	x = 0.1;
	y = 0.1;
	w = 0.2;
	h = 0.2;
	sizeEx = 0.030;
	size = 0.030;
	lineSpacing = 1;

	colorBackground[] = {0,0,0,0};
	colorText[] = {0.6, 0.8392, 0.4706, 0};

	text = "";

	class Attributes
	{
		font  = "Zeppelin32";
		color = "#FF6600";
		align = "left";
		shadow = false;
	};
};

class RscText
{
	type              = CT_STATIC;
	idc               = -1;
	style             = ST_LEFT;
	colorBackground[] = {0, 0, 0, 0};
	colorText[]       = {1, 1, 1, 1};
	font              = FontM;
	sizeEx            = 0.02;
	text              = "";
};
class D_RscTextTitle

{

type              = CT_STATIC;
idc               = -1;
style             = ST_LEFT;
colorBackground[] = {0, 0, 0, 0};
colorText[]       = {1, 1, 1, 1};
font              = FontM;
sizeEx            = 0.04;
text              = "";

};
class RscBgRahmen

{

type              = CT_STATIC;
idc               = -1;
style             = ST_FRAME;
colorBackground[] = {0,0,0,0};
colorText[]       = {1, 1, 1, 1};
font              = FontM;
SizeEX            = 0.025;
text              = "";

};

class RscBackground

{

colorBackground[] = { 0, 0, 0, 0.8 };
text              = "";
type              = CT_STATIC;
idc               = -1;
style             = ST_LEFT;
colorText[]       = {1, 1, 1, 1};
font              = FontM;
sizeEx            = 0.04;

};

class RscPicture

{

type              = CT_STATIC;
idc               =  -1;
style             = ST_PICTURE;
colorBackground[] = {0, 0, 0, 0};
colorText[]       = {1, 1, 1, 1};
font              = FontM;
sizeEx            = 0.02;
text              = "";

};

class RscBackgroundPicture

{

type              = CT_STATIC;
idc               =  -1;
style             = ST_PICTURE;
colorBackground[] = {0, 0, 0, 0};
colorText[]       = {1, 1, 1, 1};
font              = FontM;
sizeEx            = 0.02;
text              = "dbg.pac";

};

class RscButton
{
	type                      = CT_BUTTON;
	idc                       = -1;
	style                     = ST_CENTER;
	colorText[]               = {1, 1, 1, 1};
	font                      = FontHTML;
	sizeEx                    = 0.025;
	soundPush[]               = {"", 0.2, 1};
	soundClick[] = {"\ca\ui\data\sound\mouse3", 0.07, 1};
	soundEscape[] = {"\ca\ui\data\sound\mouse1", 0.09, 1};
	default                   = false;
	text                      = "";
	colorActive[]             = {0, 0, 0, 0};
	colorDisabled[]           = {1,1,1,0.5};
	colorBackground[]         = {0,0,0,1};
	colorBackgroundActive[]   = {0,0,0,1};
	colorBackgroundDisabled[] = {0,0,0,0.5};
	colorFocused[]            = {0,0,0,1};
	colorShadow[]             = {0, 0, 0, 0.1};
	colorBorder[]             = {1, 1, 1, 0};
	offsetX                   = 0;
	offsetY                   = 0;
	offsetPressedX            = 0;
	offsetPressedY            = 0;
	borderSize                = 0;
	soundEnter[]              = {"", 0.15, 1};
	action = "closeDialog 0;";
};

class RscDummy : RscButton

{

x   = -1.0;
y   = -1.0;
idc = -1;
w   = 0;
h   = 0;
default = true;

};

class Swag_RscButton : RscButton {
	style = 2;
	x = 0;
	y = 0;
	w = 0.095589;
	h = 0.039216;
	shadow = 0;
	font = "Zeppelin32";
	sizeEx = 0.03921;
	colorText[] = {0,0,0,0};
	colorDisabled[] = {0,0,0,0};
	colorBackground[] = {0,0,0,0};
	colorBackgroundActive[] = {0,0,0,0};
	colorBackgroundDisabled[] = {0,0,0,0};
	offsetX = 0.003;
	offsetY = 0.003;
	offsetPressedX = 0.002;
	offsetPressedY = 0.002;
	colorFocused[] = {0,0,0,0};
	colorShadow[] = {0,0,0,0};
	colorBorder[] = {0,0,0,0};
	borderSize = 0.0;
	soundEnter[] = {"\ca\ui\data\sound\onover", 0.09, 1};
	soundPush[] = {"\ca\ui\data\sound\new1", 0.0, 0};
	soundClick[] = {"\ca\ui\data\sound\onclick", 0.07, 1};
	soundEscape[] = {"\ca\ui\data\sound\onescape", 0.09, 1};
};

class RscEdit

{

type = CT_EDIT;
idc = -1;
style = ST_LEFT+ST_MULTI;
font = FontHTML;
sizeEx = 0.02;
colorText[] = {1, 1, 1, 1};
colorSelection[] = {0.5, 0.5, 0.5, 1};
autocomplete = false;text = "";

};

class RscLB_C
{
	style                   = ST_LEFT;
	idc                     = -1;
	colorSelect[]           = {1, 1, 1, 1};
	colorSelectBackground[] = {0, 0, 0, 0.5};
	colorText[]             = {1, 1, 1, 1};
	colorBackground[]       = {0, 0, 0, 0.5};
	colorScrollbar[] 	= {Dlg_Color_White,1};
	font                    = FontHTML;
	sizeEx                  = 0.025;
	rowHeight               = 0.04;
	period 			= 1.200000;
	maxHistoryDelay 	= 1.000000;
	autoScrollSpeed 	= -1;
	autoScrollDelay 	= 5;
	autoScrollRewind 	= 0;

	class ScrollBar {};
};

class RscListBox: RscLB_C
{
	soundSelect[] = {"", 0.1, 1};
	type          = CT_LISTBOX;
};

class RscCombo: RscLB_C

{
	type            = CT_COMBO;
	wholeHeight     = 0.3;
	soundSelect[]   = {"", 0.15, 1};
	soundExpand[]   = {"", 0.15, 1};
	soundCollapse[] = {"", 0.15, 1};
	arrowEmpty = "\ca\ui\data\ui_arrow_combo_ca.paa";
	arrowFull = "\ca\ui\data\ui_arrow_combo_active_ca.paa";
};

class RscSliderH
{
	type    = CT_SLIDER;
	idc     = -1;
	sizeEx  = 0.025;
	style   = 1024;
	color[] = {0.2, 0.2, 0.2, 1};
	colorActive[] = {1, 1, 1, 1};
};

class RscSliderV

{

type    = CT_SLIDER;
idc     = -1;
sizeEx  = 0.025;
style   = 0;
color[] = {0.2, 0.2, 0.2, 1};
colorActive[] = {1, 1, 1, 1};

};

class Rsc_lable 
{
	type = 0;
	style = 0;
	idc = -1;
	x = 0;
	y =0;
	w = 0;
	h = 0;
	text = "";
	colorBackground[] = {0,0,0,1};
	colorText[] = {1,1,1,1};
	font = "Zeppelin32";
	sizeEx = 0.04;
};

class RscListNBox
{

type = 102;
style =ST_MULTI;
w = 0.4;   h = 0.4; 
font = "Zeppelin32"; 
sizeEx = 0.04; 
colorText[] = {0.8784, 0.8471, 0.651, 1}; 
colorBackground[] = {0, 0, 0, 1}; 

autoScrollSpeed = -1; 
autoScrollDelay = 5; 
autoScrollRewind = 0; 
arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)"; 
arrowFull = "#(argb,8,8,3)color(1,1,1,1)"; 
columns[] = {0.3, 0.6, 0.7,0.8}; 
color[] = {1, 1, 1, 1}; 
colorScrollbar[] = {0.95, 0.95, 0.95, 1}; 
colorSelect[] = {0.95, 0.95, 0.95, 1}; 
colorSelect2[] = {0.95, 0.95, 0.95, 1}; 
colorSelectBackground[] = {0, 0, 0, 1}; 
colorSelectBackground2[] = {0.8784, 0.8471, 0.651, 1}; 
drawSideArrows = 0; 
idcLeft = -1; 
idcRight = -1; 
maxHistoryDelay = 1; 
rowHeight = 0; 
soundSelect[] = {"", 0.1, 1}; 
period = 1; 
shadow = 2; 
	class ScrollBar
	{
		 arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
		 arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
		 border = "#(argb,8,8,3)color(1,1,1,1)";
		 color[] = {1,1,1,0.6};
		 colorActive[] = {1,1,1,1};
		 colorDisabled[] = {1,1,1,0.3};
		 thumb = "#(argb,8,8,3)color(1,1,1,1)";
	 };
};