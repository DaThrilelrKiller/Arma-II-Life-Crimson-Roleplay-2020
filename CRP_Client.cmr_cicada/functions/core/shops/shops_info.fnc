private ["_data","_type","_itemIndex","_stock","_selectedIndex","_item"];

lbClear 303;


_data = call compile(lbData [301, (lbCurSel 301)]);
if (isNil "_data")exitWith {};
_item = _data select 0;
_data = _data select 1;
_type = _data call config_type;

_selectedIndex = lbCurSel 301;
_itemIndex = -1;
if (!isNil "shop_buylist" && {typeName shop_buylist == "ARRAY"}) then {
	{
		if (_x == _item) exitWith {
			_itemIndex = _forEachIndex;
		};
	} forEach shop_buylist;
};

_stock = if (_itemIndex >= 0 && {!isNil "shop_object"} && {!isNull shop_object}) then {
	[shop_object, _itemIndex] call shops_getStock
} else {
	0
};

lbadd [303,format ["Buy cost: %1$",_data call config_buycost]];
lbadd [303,format ["Sell cost: %1$",_data call config_sellcost]];
lbadd [303,format ["Stock: %1",_stock]];
lbadd [303,format ["Illegal: %1",(_data call config_illegal)call core_convertBoolean]];
lbadd [303,format ["Kind: %1",_data call config_kind]];
lbadd [303,format ["Type: %1",_data call config_type]];
lbadd [303,format ["Licence: %1",(_data call config_license1)call licenses_name]];
lbadd [303,format ["Licence: %1",(_data call config_licence2)call licenses_name]];


if (_type == "Item")exitWith {
	lbadd [303,format ["Dropable: %1",(_data call config_dropable)call core_convertBoolean]];
	lbadd [303,format ["Loseable: %1",(_data call config_looseable)call core_convertBoolean]];
};
if (_type == "vehicle")exitWith {
	lbadd [303,format ["Storage: %1",_data call config_storage]];
	(_data call config_class) call shops_vehicleInfo;
};

if (_type == "App")exitWith {};
if (_type == "siren")exitWith {};
if (_type == "upgrade")exitWith {};
if (_type == "weapon")exitWith {};
if (_type == "magazin")exitWith {};
