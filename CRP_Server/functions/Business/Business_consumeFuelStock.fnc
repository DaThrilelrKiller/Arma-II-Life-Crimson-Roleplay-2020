/*
	Consumes fuel stock (litres) from an owned fuel station.
	Params: [player, shopObject, shopIndex, litresToConsume]
*/

private ["_player","_shop","_shopIndex","_litres"];
_player = _this select 0;
_shop = _this select 1;
_shopIndex = _this select 2;
_litres = _this select 3;

if (isNil "_shop" || {isNull _shop}) exitWith {};
if (isNil "_litres" || {typeName _litres != "SCALAR"} || {_litres <= 0}) exitWith {};

call S_Business_ensureFuelStations;
if ((business_fuelStations find _shop) < 0) exitWith {};

private ["_section","_stock","_newStock"];
_section = format ["Fuel_%1", _shopIndex];
_stock = ["Businesses", _section, "FuelStock", dtk_fuelStockMax] call s_stats_read;
_newStock = _stock - _litres;
if (_newStock < 0) then { _newStock = 0; };

["Businesses", _section, "FuelStock", _newStock] call s_stats_write;
[_shop, _shopIndex, _newStock] call S_Business_syncFuelPump;

