/*
	Adds fuel stock (litres) to an owned fuel station.
	Params: [player, shopObject, shopIndex, litresToAdd]
*/

private ["_player","_shop","_shopIndex","_litres"];
_player = _this select 0;
_shop = _this select 1;
_shopIndex = _this select 2;
_litres = _this select 3;

if (isNil "_player" || {isNull _player}) exitWith {};
if (isNil "_shop" || {isNull _shop}) exitWith {};
if (isNil "_litres" || {typeName _litres != "SCALAR"} || {_litres <= 0}) exitWith {};

call S_Business_ensureFuelStations;
if ((business_fuelStations find _shop) < 0) exitWith {};

private ["_section","_ownerUid","_myUid","_stock","_newStock"];
_section = format ["Fuel_%1", _shopIndex];
_ownerUid = ["Businesses", _section, "OwnerUID", ""] call s_stats_read;
_myUid = getPlayerUID _player;

if (_ownerUid != _myUid) exitWith { [_player, ["You don't own this fuel station."], {systemChat _this}, false, false] call network_MPExec; };

_stock = ["Businesses", _section, "FuelStock", dtk_fuelStockMax] call s_stats_read;
_newStock = _stock + _litres;
if (_newStock > dtk_fuelStockMax) then { _newStock = dtk_fuelStockMax; };

["Businesses", _section, "FuelStock", _newStock] call s_stats_write;
[_shop, _shopIndex, _newStock] call S_Business_syncFuelPump;

[_player, [format ["Fuel stock updated: %1 / %2 litres", _newStock, dtk_fuelStockMax]], {systemChat _this}, false, false] call network_MPExec;

