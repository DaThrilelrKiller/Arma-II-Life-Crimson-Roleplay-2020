﻿if (dtk_server)exitWith {};

private ["_data","_img","_text","_color","_shop"];

{
	_shop = _x select 0;	
	if (!isNil "_shop")then {	
		_shop setVariable ['shop_data',_forEachIndex,false];
		
		_color = if ([_shop]call shops_illegal)then {"ColorRed"}else{"ColorBlue"};
		
		[("shop_" + str _ForEachIndex),getPos (_x select 0),nil,nil,_color,"mil_dot",[1,1],(_x select 1 select 1)]call core_createMarkerLocal;
		
		if (_color == "ColorRed" && {dtk_cop})then {
			(_x select 0) addaction ["Search Shop","noscript.sqf",format["[%1]call police_SearchBox;",_ForEachIndex], 25, false, true, "LeanRight","player distance _target < 5 && {K9_id}"];
		};

		_data = _x select 1;
		_img = _data select 0;
		_img = if (_img != "")then {format ["\crp_data\images\tags\%1",_img]}else{""};
		_text = _data select 1;
		
		if (typeOf _shop == "Infostand_2_EP1")then {
			_shop setObjectTexture [1, "\ol_textures\images\stands\shop.paa"];
		}else{
			_shop addaction ["Open Gear","noscript.sqf", format ["[%1]call gear_open",_x], 1, false, true,"Gear"];
		};	
		
		(_x select 0) addaction ["","noscript.sqf",format["[%1]call shops_open;",_ForEachIndex], 25, false, true, "LeanRight",format ["player distance _target < 5 && {!([_target,'%2 (%3)','%1']call tag_show)}",_img,_text,((actionKeysNamesArray "LEANRIGHT")select 0)]];
	};
}forEach INV_ItemShops;