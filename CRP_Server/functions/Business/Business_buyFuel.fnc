/*
	Buys a fuel station business.
	- If unowned: assigns owner.
	- If owned and for-sale: transfers ownership and pays seller (bank + business balance).

	Params: [player, shopObject, shopIndex, paidPrice]
*/

private ["_buyer","_shop","_shopIndex","_paidPrice"];
_buyer = _this select 0;
_shop = _this select 1;
_shopIndex = _this select 2;
_paidPrice = if (count _this >= 4) then {_this select 3} else {0};

if (isNil "_buyer" || {isNull _buyer}) exitWith {};
if (isNil "_shop" || {isNull _shop}) exitWith {};
if (isNil "_paidPrice" || {typeName _paidPrice != "SCALAR"} || {_paidPrice < 0}) then {_paidPrice = 0;};

call S_Business_ensureFuelStations;
if ((business_fuelStations find _shop) < 0) exitWith {};

private ["_section","_curOwnerUid","_curOwnerName","_balance","_forSale","_buyerUid","_buyerName"];
_section = format ["Fuel_%1", _shopIndex];

_curOwnerUid = ["Businesses", _section, "OwnerUID", ""] call s_stats_read;
_curOwnerName = ["Businesses", _section, "OwnerName", ""] call s_stats_read;
_balance = ["Businesses", _section, "Balance", 0] call s_stats_read;
_forSale = ["Businesses", _section, "ForSalePrice", 0] call s_stats_read;

_buyerUid = getPlayerUID _buyer;
_buyerName = name _buyer;

// Already owned by buyer
if (_curOwnerUid == _buyerUid) exitWith {
	[_buyer, ["You already own this fuel station."], {systemChat _this}, false, false] call network_MPExec;
};

// Unowned purchase
if (_curOwnerUid == "") then {
	// Best-effort price check (refund client if mismatch)
	private ["_expected"];
	_expected = if (isNil "dtk_fuelStationBuyPrice") then {250000} else {dtk_fuelStationBuyPrice};
	if (_paidPrice > 0 && {_paidPrice != _expected}) exitWith {
		[_buyer, [_paidPrice], "business_fuel_refund", false, false] call network_MPExec;
		[_buyer, ["Fuel Station purchase failed (price changed). Refunded."], {systemChat _this}, false, false] call network_MPExec;
	};

	["Businesses", _section, "OwnerUID", _buyerUid] call s_stats_write;
	["Businesses", _section, "OwnerName", _buyerName] call s_stats_write;
	["Businesses", _section, "Balance", 0] call s_stats_write;
	["Businesses", _section, "ForSalePrice", 0] call s_stats_write;
	["Businesses", _section, "FuelStock", dtk_fuelStockMax] call s_stats_write;

	[_shop, _shopIndex, dtk_fuelStockMax] call S_Business_syncFuelPump;

	[_buyer, ["You bought this fuel station."], {systemChat _this}, false, false] call network_MPExec;
	exitWith {};
};

// Owned purchase (must be for sale)
if (_forSale <= 0) exitWith {
	if (_paidPrice > 0) then {
		[_buyer, [_paidPrice], "business_fuel_refund", false, false] call network_MPExec;
	};
	[_buyer, [format ["This fuel station is owned by %1 and is not for sale.", _curOwnerName]], {systemChat _this}, false, false] call network_MPExec;
};

if (_paidPrice <= 0 || {_paidPrice != _forSale}) exitWith {
	if (_paidPrice > 0) then {
		[_buyer, [_paidPrice], "business_fuel_refund", false, false] call network_MPExec;
	};
	[_buyer, ["Fuel Station purchase failed (price mismatch). Refunded."], {systemChat _this}, false, false] call network_MPExec;
};

// Pay seller: sale price + business balance, deposited into seller's persisted bank
private ["_sellerUid","_sellerBank","_payout","_stock"];
_sellerUid = _curOwnerUid;
_sellerBank = [_sellerUid, "Main", "Bank", 45000] call s_stats_read;
_payout = _forSale + _balance;
[_sellerUid, "Main", "Bank", (_sellerBank + _payout)] call s_stats_write;

// Transfer ownership; reset balance and clear sale price
["Businesses", _section, "OwnerUID", _buyerUid] call s_stats_write;
["Businesses", _section, "OwnerName", _buyerName] call s_stats_write;
["Businesses", _section, "Balance", 0] call s_stats_write;
["Businesses", _section, "ForSalePrice", 0] call s_stats_write;

// Keep existing station stock on transfer
_stock = ["Businesses", _section, "FuelStock", dtk_fuelStockMax] call s_stats_read;
[_shop, _shopIndex, _stock] call S_Business_syncFuelPump;

[_buyer, ["You bought this fuel station."], {systemChat _this}, false, false] call network_MPExec;

