/*
	Returns fuel station business data to a client.
	Params: [player, shopObject, shopIndex]
*/

private ["_player","_shop","_shopIndex"];
_player = _this select 0;
_shop = _this select 1;
_shopIndex = _this select 2;

if (isNil "_player" || {isNull _player}) exitWith {};
if (isNil "_shop" || {isNull _shop}) exitWith {};

call S_Business_ensureFuelStations;
if ((business_fuelStations find _shop) < 0) exitWith {};

private ["_section","_ownerUid","_ownerName","_balance","_forSale","_stock"];
_section = format ["Fuel_%1", _shopIndex];
_ownerUid = ["Businesses", _section, "OwnerUID", ""] call s_stats_read;
_ownerName = ["Businesses", _section, "OwnerName", ""] call s_stats_read;
_balance = ["Businesses", _section, "Balance", 0] call s_stats_read;
_forSale = ["Businesses", _section, "ForSalePrice", 0] call s_stats_read;
_stock = ["Businesses", _section, "FuelStock", dtk_fuelStockMax] call s_stats_read;

// Keep the nearest physical pump updated for all clients
[_shop, _shopIndex, _stock] call S_Business_syncFuelPump;

// Cache on client (for scroll-wheel Buy/Manage visibility) + update dialog if open
[_player, [_shopIndex, _ownerUid, _ownerName, _balance, _forSale, _stock], "business_fuel_cacheReceive", false, false] call network_MPExec;
[_player, [_shopIndex, _ownerUid, _ownerName, _balance, _forSale, _stock], "business_fuel_receive", false, false] call network_MPExec;

