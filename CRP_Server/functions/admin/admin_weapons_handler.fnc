
private ["_Cursel"];
while {ctrlVisible 1502} do
{
	lbClear 1502;
	[1502,(call compile lbData [2100, lbCurSel 2100]select 1),true]call storage_toDialog;
	_Cursel = (lbCurSel 2100);
	waitUntil {_Cursel != (lbCurSel 2100)};
	sleep 0.5;
};