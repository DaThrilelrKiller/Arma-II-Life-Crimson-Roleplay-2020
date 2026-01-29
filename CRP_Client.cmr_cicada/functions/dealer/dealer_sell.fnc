_vehicle = call compile lbData [2, (lbCurSel 2)];
if (isNil "_vehicle")exitWith {};

_price = ctrlText 1;
if !(_price call storage_isNumber)exitWith {systemchat format ["%1 is not a valid number",_amount];};
_price = parseNumber _price;

_spot = []call dealer_SpotAvailable;

if (typeName _spot == "STRING")exitWith {
	systemchat "There is no vehicle lots available please check back later!";
};

[_vehicle,[_vehicle,true],'network_lock',false,true]call network_MPExec;
_vehicle setDir (_spot select 1);
_vehicle setPosASL (_spot select 0);
_vehicle setVariable ["Dealer_Data",[name player,_price],true];
_vehicle setVariable ["dtk_keys",[],true];

["ALL",[_vehicle,['','noscript.sqf',format["[%1,%2]call dealer_buy",_vehicle,_price],25,false,true,'LeanRight','!(isNil {_target getVariable "Dealer_Data"}) && {!([_target]call dealer_info)}']],"network_addAction",false,true]call network_MPExec;
closeDialog 0;