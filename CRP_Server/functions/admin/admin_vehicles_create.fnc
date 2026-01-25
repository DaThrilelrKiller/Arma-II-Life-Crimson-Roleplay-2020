private ["_amount","_data","_item","_to","_name"];
_data = call compile(lbData [1501, (lbCurSel 1501)]);
_item = _data select 0;
_name = lbText [1501, (lbCurSel 1501)];

[_item,screenToWorld[0.5,0.5],player,dtk_side]call shops_createVehicle;
systemchat format ["%1 spawned you %2", name player, _name];