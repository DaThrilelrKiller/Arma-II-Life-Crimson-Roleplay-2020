/*
	Withdraws the full balance for a fuel station to the owner.
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

private ["_section","_ownerUid","_myUid","_balance"];
_section = format ["Fuel_%1", _shopIndex];
_ownerUid = ["Businesses", _section, "OwnerUID", ""] call s_stats_read;
if (_ownerUid == "") exitWith { [_player, ["This fuel station is unowned."], {systemChat _this}, false, false] call network_MPExec; };

_myUid = getPlayerUID _player;
if (_ownerUid != _myUid) exitWith { [_player, ["You don't own this fuel station."], {systemChat _this}, false, false] call network_MPExec; };

_balance = ["Businesses", _section, "Balance", 0] call s_stats_read;
if (_balance <= 0) exitWith { [_player, ["No balance to withdraw."], {systemChat _this}, false, false] call network_MPExec; };

["Businesses", _section, "Balance", 0] call s_stats_write;
[_player, [_balance], "business_fuel_withdrawReceive", false, false] call network_MPExec;

