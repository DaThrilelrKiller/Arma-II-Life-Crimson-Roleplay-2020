/*
	Fuel station business client helpers.

	Loaded lazily from shops_init.fnc so we don't depend on missing global loaders.
*/

if (!isNil "business_fuel_inited") exitWith {};
business_fuel_inited = true;

business_fuel_shopObject = objNull;
business_fuel_shopIndex = -1;
business_fuel_data = [-1, "", "", 0, 0, 0]; // [shopIndex, ownerUid, ownerName, balance, forSalePrice, stock]

business_fuel_getMyUid = {
	getPlayerUID player
};

business_fuel_isIntegerString = {
	private ["_s"];
	_s = _this;
	if (isNil "_s") exitWith {false};
	if (typeName _s != "STRING") exitWith {false};
	(_s call string_isInteger)
};

business_fuel_updateDialog = {
	private ["_disp","_shopIndex","_ownerUid","_ownerName","_balance","_forSale","_stock","_ownerText","_myUid","_btnBuy","_btnBuyForSale","_btnWithdraw","_btnSetForSale","_btnDeposit"];
	_disp = findDisplay 7200;
	if (isNull _disp) exitWith {};

	_shopIndex = business_fuel_data select 0;
	_ownerUid = business_fuel_data select 1;
	_ownerName = business_fuel_data select 2;
	_balance = business_fuel_data select 3;
	_forSale = business_fuel_data select 4;
	_stock = business_fuel_data select 5;

	(_disp displayCtrl 7101) ctrlSetText format ["Fuel Station #%1", _shopIndex];

	_ownerText = if (_ownerUid == "") then {"Unowned"} else {format ["Owned by: %1", _ownerName]};
	(_disp displayCtrl 7102) ctrlSetText _ownerText;

	(_disp displayCtrl 7103) ctrlSetText format ["Balance: %1", [_balance] call Main_FormatMoney];
	(_disp displayCtrl 7104) ctrlSetText format ["For sale: %1", if (_forSale > 0) then {[_forSale] call Main_FormatMoney} else {"No"}];
	(_disp displayCtrl 7106) ctrlSetText format ["Stock: %1 / %2 litres", _stock, if (isNil 'dtk_fuelStockMax') then {400} else {dtk_fuelStockMax}];

	// Set edit box to current for-sale price (or 0)
	(_disp displayCtrl 7105) ctrlSetText str _forSale;

	_myUid = call business_fuel_getMyUid;

	_btnBuy = (_disp displayCtrl 7110);
	_btnBuyForSale = (_disp displayCtrl 7111);
	_btnWithdraw = (_disp displayCtrl 7112);
	_btnSetForSale = (_disp displayCtrl 7113);
	_btnDeposit = (_disp displayCtrl 7115);

	_btnBuy ctrlEnable (_ownerUid == "");
	_btnBuyForSale ctrlEnable (_ownerUid != "" && {_ownerUid != _myUid} && {_forSale > 0});
	_btnWithdraw ctrlEnable (_ownerUid == _myUid && {_balance > 0});
	_btnSetForSale ctrlEnable (_ownerUid == _myUid);
	_btnDeposit ctrlEnable (_ownerUid == _myUid);
};

business_fuel_receive = {
	// Params: [shopIndex, ownerUid, ownerName, balance, forSalePrice, stock]
	private ["_shopIndex","_ownerUid","_ownerName","_balance","_forSale","_stock"];
	_shopIndex = _this select 0;
	_ownerUid = _this select 1;
	_ownerName = _this select 2;
	_balance = _this select 3;
	_forSale = _this select 4;
	_stock = _this select 5;

	// Ignore stale responses
	if (_shopIndex != business_fuel_shopIndex) exitWith {};

	business_fuel_data = [_shopIndex, _ownerUid, _ownerName, _balance, _forSale, _stock];
	call business_fuel_updateDialog;
};

business_fuel_withdrawReceive = {
	private ["_amount"];
	_amount = _this select 0;
	if (isNil "_amount") exitWith {};
	if (typeName _amount != "SCALAR") exitWith {};
	if (_amount <= 0) exitWith {};
	dtk_bank = dtk_bank + _amount;
	systemChat format ["Fuel Station payout: %1 added to your bank.", [_amount] call Main_FormatMoney];
};

business_fuel_refund = {
	private ["_amount"];
	_amount = _this select 0;
	if (isNil "_amount") exitWith {};
	if (typeName _amount != "SCALAR") exitWith {};
	if (_amount <= 0) exitWith {};
	dtk_bank = dtk_bank + _amount;
	systemChat format ["Fuel Station refund: %1 added to your bank.", [_amount] call Main_FormatMoney];
};

business_fuel_requestRefresh = {
	if (isNull business_fuel_shopObject) exitWith {};
	if (business_fuel_shopIndex < 0) exitWith {};
	["SERVER",[player,business_fuel_shopObject,business_fuel_shopIndex],"S_business_getFuel",false,false] call network_MPExec;
};

business_fuel_open = {
	private ["_target"];
	_target = _this select 0;
	if (isNil "_target" || {isNull _target}) exitWith {};

	business_fuel_shopObject = _target;
	business_fuel_shopIndex = _target getVariable ["shop_data",-1];
	if (business_fuel_shopIndex < 0) exitWith { systemChat "Fuel Business: could not resolve shop index."; };

	business_fuel_data = [business_fuel_shopIndex, "", "", 0, 0];
	business_fuel_data set [5, 0];

	createDialog "fuel_business_dialog";
	call business_fuel_updateDialog;
	call business_fuel_requestRefresh;
};

business_fuel_buy = {
	// Buy unowned station
	private ["_ownerUid","_price"];
	_ownerUid = business_fuel_data select 1;
	if (_ownerUid != "") exitWith { systemChat "This fuel station is already owned."; };

	_price = if (isNil "dtk_fuelStationBuyPrice") then {250000} else {dtk_fuelStationBuyPrice};
	if (dtk_bank < _price) exitWith { systemChat format ["You need %1 in bank to buy this station.", [_price] call Main_FormatMoney]; };

	dtk_bank = dtk_bank - _price;
	["SERVER",[player,business_fuel_shopObject,business_fuel_shopIndex,_price],"S_business_buyFuel",false,false] call network_MPExec;
	call business_fuel_requestRefresh;
};

business_fuel_buyForSale = {
	// Buy from another player if for sale
	private ["_ownerUid","_forSale"];
	_ownerUid = business_fuel_data select 1;
	_forSale = business_fuel_data select 4;
	if (_ownerUid == "") exitWith { systemChat "This station is unowned (use Buy)."; };
	if (_forSale <= 0) exitWith { systemChat "This station is not for sale."; };
	if (_ownerUid == (call business_fuel_getMyUid)) exitWith { systemChat "You already own this station."; };

	if (dtk_bank < _forSale) exitWith { systemChat format ["You need %1 in bank to buy this station.", [_forSale] call Main_FormatMoney]; };

	dtk_bank = dtk_bank - _forSale;
	["SERVER",[player,business_fuel_shopObject,business_fuel_shopIndex,_forSale],"S_business_buyFuel",false,false] call network_MPExec;
	call business_fuel_requestRefresh;
};

business_fuel_withdraw = {
	["SERVER",[player,business_fuel_shopObject,business_fuel_shopIndex],"S_business_withdrawFuel",false,false] call network_MPExec;
	call business_fuel_requestRefresh;
};

business_fuel_setForSale = {
	private ["_disp","_priceText","_price"];
	_disp = findDisplay 7200;
	if (isNull _disp) exitWith {};

	_priceText = ctrlText 7105;
	if (!(_priceText call business_fuel_isIntegerString)) exitWith { systemChat "Enter a valid number (0 = not for sale)."; };
	_price = _priceText call string_toInt;
	if (_price < 0) exitWith { systemChat "Price must be 0 or more."; };

	["SERVER",[player,business_fuel_shopObject,business_fuel_shopIndex,_price],"S_business_setForSaleFuel",false,false] call network_MPExec;
	call business_fuel_requestRefresh;
};

business_fuel_deposit = {
	// Deposits all GasBarrel items into station stock
	private ["_ownerUid","_myUid","_count","_litersPer","_liters"];
	_ownerUid = business_fuel_data select 1;
	_myUid = call business_fuel_getMyUid;
	if (_ownerUid != _myUid) exitWith { systemChat "You don't own this fuel station."; };

	_count = [player,"GasBarrel"] call storage_amount;
	if (_count <= 0) exitWith { systemChat "You have no Gasoline Barrels to deposit."; };

	_litersPer = if (isNil "dtk_fuelBarrelLiters") then {100} else {dtk_fuelBarrelLiters};
	_liters = _count * _litersPer;

	[player,"GasBarrel",-_count] call storage_add;
	["SERVER",[player,business_fuel_shopObject,business_fuel_shopIndex,_liters],"S_business_addFuelStock",false,false] call network_MPExec;
	call business_fuel_requestRefresh;
};

business_fuel_recordSale = {
	// Params: [saleAmount]
	private ["_saleAmount","_fuelObjects","_shopIndex"];
	_saleAmount = _this select 0;
	if (isNil "_saleAmount" || {typeName _saleAmount != "SCALAR"} || {_saleAmount <= 0}) exitWith {};
	if (isNull shop_object) exitWith {};

	// Only report sales for fuel station shops
	_fuelObjects = missionNamespace getVariable ["dtk_fuelShopObjects", []];
	if (typeName _fuelObjects != "ARRAY") exitWith {};
	if ((_fuelObjects find shop_object) < 0) exitWith {};

	_shopIndex = shop_object getVariable ["shop_data",-1];
	if (_shopIndex < 0) exitWith {};

	["SERVER",[player,shop_object,_shopIndex,_saleAmount],"S_business_recordSale",false,false] call network_MPExec;
};

