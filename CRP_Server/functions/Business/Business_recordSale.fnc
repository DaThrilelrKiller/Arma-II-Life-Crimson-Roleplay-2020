/*
	Records a sale for an owned fuel station, crediting business balance.
	Params: [player, shopObject, shopIndex, saleAmount]
*/

private ["_player","_shop","_shopIndex","_saleAmount"];
_player = _this select 0;
_shop = _this select 1;
_shopIndex = _this select 2;
_saleAmount = _this select 3;

if (isNil "_shop" || {isNull _shop}) exitWith {};
if (isNil "_saleAmount" || {typeName _saleAmount != "SCALAR"} || {_saleAmount <= 0}) exitWith {};

call S_Business_ensureFuelStations;
if !(_shop in business_fuelStations) exitWith {};

private _section = format ["Fuel_%1", _shopIndex];
private _ownerUid = ["Businesses", _section, "OwnerUID", ""] call s_stats_read;
if (_ownerUid == "") exitWith {};

private _rate = if (isNil "dtk_fuelProfitRate") then {0.10} else {dtk_fuelProfitRate};
if (_rate < 0) then {_rate = 0;};
if (_rate > 1) then {_rate = 1;};

private _profit = round (_saleAmount * _rate);
if (_profit <= 0) exitWith {};

private _balance = ["Businesses", _section, "Balance", 0] call s_stats_read;
private _newBalance = _balance + _profit;

["Businesses", _section, "Balance", _newBalance] call s_stats_write;

