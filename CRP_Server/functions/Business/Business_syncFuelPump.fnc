/*
	Sets the nearest physical fuel pump feed object's variables for a station.
	Params: [shopObject, shopIndex, stock]
*/

private ["_shop","_shopIndex","_stock"];
_shop = _this select 0;
_shopIndex = _this select 1;
_stock = _this select 2;

if (isNil "_shop" || {isNull _shop}) exitWith {};
if (isNil "_stock" || {typeName _stock != "SCALAR"}) exitWith {};

private _feeds = nearestObjects [getPos _shop, ["MAP_A_FuelStation_Feed","Land_A_Fuelstation_Feed","Land_Ind_FuelStation_Feed_EP1","Land_benzina_schnell","Land_fuelstation_army"], 35];
if (count _feeds == 0) exitWith {};

private _feed = _feeds select 0;
_feed setVariable ["fuel_stationShopIndex", _shopIndex, true];
_feed setVariable ["fuel_stock", _stock, true];

