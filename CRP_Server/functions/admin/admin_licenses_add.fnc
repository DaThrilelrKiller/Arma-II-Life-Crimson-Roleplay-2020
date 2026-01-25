
private ["_amount","_data","_item","_to","_name"];
_data = (lbData [1501, (lbCurSel 1501)]);
_to = (call compile lbData [2100, lbCurSel 2100]select 1);
_name = lbText [1501, (lbCurSel 1501)];

[_to,_data] call licenses_add;
[_to,["true",format ["%1 gave you %2", name player, _name],3],"network_chat",false,false]call network_MPExec;
[player,format['added %1 licence to %2',_name,name _to],[0.94,0.61,0,1]]call admin_logs_add;

lbClear 1502;
[1502,(call compile lbData [2100, lbCurSel 2100]select 1)]call licenses_toDialog;