
private ["_amount","_data","_item","_to","_name"];
_data = (lbData [1502, (lbCurSel 1502)]);
_to = (call compile lbData [2100, lbCurSel 2100]select 1);
_name = lbText [1502, (lbCurSel 1502)];

[_to,_data] call licenses_remove;
[_to,["true",format ["%1 removed your %2", name player, _name],3],"network_chat",false,false]call network_MPExec;
[player,format['removed %1 licence from %2',_name,name _to],[0.94,0.61,0,1]]call admin_logs_add;

lbClear 1502;
[1502,(call compile lbData [2100, lbCurSel 2100]select 1)]call licenses_toDialog;