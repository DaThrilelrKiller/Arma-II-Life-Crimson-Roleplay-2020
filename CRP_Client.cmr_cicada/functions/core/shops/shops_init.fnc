if (dtk_server)exitWith {};

private ["_data","_img","_text","_color","_shop","_shopPos","_shopType","_leanRightKey","_fuelStationNames"];

_leanRightKey = ((actionKeysNamesArray "LEANRIGHT")select 0);

// Fuel station businesses (lazy init)
if (isNil "business_fuel_inited") then {
	call compile preprocessFile "scripts\business\fuel_init.sqf";
};

// Deterministic detection of fuel shops by configured display name (CfgShops.sqf)
_fuelStationNames = ["Mikes Hard Gas","Gas n Porn","Gas Hause","Gas n Pit","Gas n Chips"];
dtk_fuelShopObjects = [];

{
	_shop = _x select 0;	
	if (!isNil "_shop")then {	
		_shop setVariable ['shop_data',_forEachIndex,false];
		
		_shopPos = getPos _shop;
		_shopType = typeOf _shop;
		
		_color = if ([_shop]call shops_illegal)then {"ColorRed"}else{"ColorBlue"};
		
		[("shop_" + str _ForEachIndex),_shopPos,nil,nil,_color,"mil_dot",[1,1],(_x select 1 select 1)]call core_createMarkerLocal;
		
		if (_color == "ColorRed" && {dtk_cop})then {
			_shop addaction ["Search Shop","noscript.sqf",format["[%1]call police_SearchBox;",_ForEachIndex], 25, false, true, "LeanRight","player distance _target < 5 && {K9_id}"];
		};

		_data = _x select 1;
		_img = _data select 0;
		_img = if (_img != "")then {format ["data\images\tags\%1",_img]}else{""};
		_text = _data select 1;
		
		if (_shopType == "Infostand_2_EP1")then {
			_shop setObjectTexture [1, "\ol_textures\images\stands\shop.paa"];
		};
		
		_shop addaction ["Open Gear","noscript.sqf", format ["[%1]call gear_open",_shop], 1, false, true,"Gear"];
		
		
		_shop addaction ["","noscript.sqf",format["[%1]call shops_open;",_ForEachIndex], 25, false, true, "LeanRight",format ["player distance _target < 5 && {!([_target,'%2 (%3)','%1']call tag_show)}",_img,_text,_leanRightKey]];

		// Fuel station business management action (fuel shops only)
		if ((_fuelStationNames find _text) > -1) then {
			dtk_fuelShopObjects set [count dtk_fuelShopObjects, _shop];
			// noscript.sqf executes the string with the original action _this, so use (_this select 0)
			_shop addAction ["","noscript.sqf","[(_this select 0)] call business_fuel_open;", 24, false, true, "LeanRight", "player distance _target < 5 && {!([_target,'Manage Fuel Station (E)','data\\images\\tags\\Gas pump']call tag_show)}"];
		};
	};
}forEach INV_ItemShops;

// Store indices after all shops have been indexed
dtk_fuelShopIndices = [];
{
	dtk_fuelShopIndices set [count dtk_fuelShopIndices, (_x getVariable ["shop_data",-1])];
} forEach dtk_fuelShopObjects;

// Associate each fuel station shop with its nearest fuel pump feed object
// so vehicle fueling can consume this station's stock.
{
	private ["_shopObj","_idx","_feeds","_feed"];
	_shopObj = _x;
	_idx = _shopObj getVariable ["shop_data",-1];
	if (_idx >= 0) then {
		_feeds = nearestObjects [getPos _shopObj, ["MAP_A_FuelStation_Feed","Land_A_Fuelstation_Feed","Land_Ind_FuelStation_Feed_EP1","Land_benzina_schnell","Land_fuelstation_army"], 35];
		if (count _feeds > 0) then {
			_feed = _feeds select 0;
			_feed setVariable ["fuel_stationShopIndex", _idx, true];
			_feed setVariable ["fuel_stationShopObj", _shopObj, true];
		};
	};
} forEach dtk_fuelShopObjects;