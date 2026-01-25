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
		
		
		// NOTE: use double-quotes inside condition string so shop names with apostrophes (e.g. "Flyer's")
		// don't break parsing.
		_shop addaction ["","noscript.sqf",format["[%1]call shops_open;",_ForEachIndex], 25, false, true, "LeanRight",format ["player distance _target < 5 && {!([_target,""%2 (%3)"",""%1""] call tag_show)}",_img,_text,_leanRightKey]];

		// Fuel station business management action (fuel shops only)
		if ((_fuelStationNames find _text) > -1) then {
			dtk_fuelShopObjects set [count dtk_fuelShopObjects, _shop];
			// Init cached ownership state (populated by server via business_fuel_cacheReceive)
			if (isNil { _shop getVariable "business_fuel_ownerUid" }) then {
				_shop setVariable ["business_fuel_ownerUid", "UNKNOWN", false];
				_shop setVariable ["business_fuel_ownerName", "", false];
				_shop setVariable ["business_fuel_forSale", 0, false];
				_shop setVariable ["business_fuel_balance", 0, false];
				_shop setVariable ["business_fuel_stock", 0, false];
			};

			// Request a fresh state from server once at init so the correct action (Buy/Manage/Info) appears quickly.
			["SERVER",[player,_shop,_forEachIndex],"S_Business_getFuel",false,false] call network_MPExec;

			// Unowned: show Buy option (scroll-wheel)
			_shop addAction [
				"Buy Fuel Station",
				"noscript.sqf",
				"[(_this select 0)] call business_fuel_open;",
				24,
				false,
				true,
				"",
				"player distance _target < 5 && {(_target getVariable ['business_fuel_ownerUid','UNKNOWN']) == ''}"
			];

			// Owned by you: show Manage option (scroll-wheel)
			_shop addAction [
				"Manage Fuel Station",
				"noscript.sqf",
				"[(_this select 0)] call business_fuel_open;",
				24,
				false,
				true,
				"",
				"player distance _target < 5 && {(_target getVariable ['business_fuel_ownerUid','UNKNOWN']) == (getPlayerUID player)}"
			];

			// Owned by someone else: show Info option (scroll-wheel)
			_shop addAction [
				"Fuel Station (Owned)",
				"noscript.sqf",
				"[(_this select 0)] call business_fuel_open;",
				24,
				false,
				true,
				"",
				"player distance _target < 5 && {(_target getVariable ['business_fuel_ownerUid','UNKNOWN']) != ''} && {(_target getVariable ['business_fuel_ownerUid','UNKNOWN']) != 'UNKNOWN'} && {(_target getVariable ['business_fuel_ownerUid','UNKNOWN']) != (getPlayerUID player)}"
			];
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