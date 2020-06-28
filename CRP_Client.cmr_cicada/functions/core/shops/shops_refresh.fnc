private["_text"];
_text = lbText [2100, (lbCurSel 2100)];

_text call {
	if (_this == "Shop")exitWith {shop_buylist call shops_buylist;};
	if (_this == "Inventoy")exitWith {shop_selllist call Shops_selllist;};
};
lbSetCurSel [301,0];
