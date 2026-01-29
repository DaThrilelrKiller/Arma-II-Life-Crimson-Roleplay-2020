private ["_selection","_item","_price","_class"];
_selection = _this select 0;
if(isNil "_selection")exitWith{hint "You need to select an item first"};

AM_temp_carrying = true;
_item = AM_classnames_total select _selection;
_class = _item select 0;
_price = _item select 1;
_pos   = _item select 2;

if (dtk_bank < _price) exitWith { player groupChat "You do not have enough money in your bank account" };
dtk_bank = dtk_bank - _price;

temp_item = _class createVehicle [0,0,0];
temp_item setVariable ["AM_CP",1,true];
temp_item attachto[player,_pos];

systemChat  "You have been charged for buying this. Press 9 to drop it on the ground.";

closeDialog 0;