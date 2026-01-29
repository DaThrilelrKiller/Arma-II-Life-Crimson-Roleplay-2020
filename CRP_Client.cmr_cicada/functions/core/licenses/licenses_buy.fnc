private ["_license","_name","_cost"];

_license = ((dtk_licenses select _this) select 0);
_name    = ((dtk_licenses select _this) select 2);
_cost    = ((dtk_licenses select _this) select 3);

[_cost,_license,_name]call shops_purchaseLic;
	

