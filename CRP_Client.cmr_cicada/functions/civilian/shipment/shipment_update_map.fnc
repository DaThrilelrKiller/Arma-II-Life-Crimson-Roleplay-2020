
disableSerialization; 

_grid = getMarkerPos lbData [1500, (lbCurSel 1500)];

if (!isNil "_grid")then
{
	_ctrl = (findDisplay 162) displayCtrl 56;

	_ctrl ctrlMapAnimAdd [1,3,_grid];
	ctrlMapAnimCommit _ctrl;
	
	_ctrl ctrlMapAnimAdd [1,0.01,_grid];
	ctrlMapAnimCommit _ctrl;
};
