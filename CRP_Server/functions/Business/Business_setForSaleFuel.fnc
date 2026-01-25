/*
	Sets the for-sale price for a fuel station (0 = not for sale).
	Params: [player, shopObject, shopIndex, price]
*/

private ["_player","_shop","_shopIndex","_price"];
_player = _this select 0;
_shop = _this select 1;
_shopIndex = _this select 2;
_price = _this select 3;

if (isNil "_player" || {isNull _player}) exitWith {};
if (isNil "_shop" || {isNull _shop}) exitWith {};
if (isNil "_price" || {typeName _price != "SCALAR"}) exitWith {};
if (_price < 0) then {_price = 0;};

call S_Business_ensureFuelStations;
if ((business_fuelStations find _shop) < 0) exitWith {};

private ["_section","_ownerUid","_myUid"];
_section = format ["Fuel_%1", _shopIndex];
_ownerUid = ["Businesses", _section, "OwnerUID", ""] call s_stats_read;
_myUid = getPlayerUID _player;

if (_ownerUid != _myUid) exitWith { [_player, ["You don't own this fuel station."], {systemChat _this}, false, false] call network_MPExec; };

["Businesses", _section, "ForSalePrice", _price] call s_stats_write;
[_player, [format ["For-sale price set to %1", _price]], {systemChat _this}, false, false] call network_MPExec;

