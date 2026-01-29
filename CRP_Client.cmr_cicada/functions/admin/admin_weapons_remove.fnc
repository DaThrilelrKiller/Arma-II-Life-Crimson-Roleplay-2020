private ["_amount","_data","_item","_to","_name"];

_amount = parseNumber ctrlText 1400;
_data = call compile(lbData [1502, (lbCurSel 1502)]);
_item = _data select 0;
_to = (call compile lbData [2100, lbCurSel 2100]select 1);
_name = lbText [1502, (lbCurSel 1502)];

[_to,_item, - _amount] call storage_add;
[_to,["true",format ["%1 removed %2 of %3 from your inventory", name player, _amount, _name],3],"network_chat",false,false]call network_MPExec;

lbClear 1502;
[1502,(call compile lbData [2100, lbCurSel 2100]select 1),true]call storage_toDialog;