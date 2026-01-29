disableSerialization; 

_grid = call compile lbData [1401, (lbCurSel 1401)];
if (!isNil "_grid")then
{
	_ctrl = (findDisplay 1600) displayCtrl 10023;
	dtk_cam camSetPos [(_grid select 0),((_grid select 1)+10),(_grid select 2)+300];
	dtk_cam camSetTarget _grid;
	_distance = dtk_cam distance  _grid;
	_time = _distance*0.005;
	dtk_cam camCommit _time;
	preloadCamera _grid;
	
	_ctrl ctrlMapAnimAdd [1,4,_grid];
	ctrlMapAnimCommit _ctrl;
	
	_ctrl ctrlMapAnimAdd [1,0.01,_grid];
	ctrlMapAnimCommit _ctrl;
	
	waitUntil {camCommitted  dtk_cam};
	dtk_cam camSetPos [(_grid select 0),((_grid select 1)+10),(_grid select 2)+50];
	dtk_cam camSetTarget _grid;
	dtk_cam camCommit 1;
	
};