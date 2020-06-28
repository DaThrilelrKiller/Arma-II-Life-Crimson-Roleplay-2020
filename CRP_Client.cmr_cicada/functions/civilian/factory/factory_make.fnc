private ["_data","_item","_cost","_time","_queue","_materials","_current"];

_index = lbCurSel 1;
_data = call compile lbData [1, _index];
_item = _data select 0;
_cost = _data select 1;
_time = _data select 2;
_materials = _item call factory_materials; 


if (_item call factory_hasMaterial)then {
	[DTK_ActiveFactory,"iron",-(_materials select 0)] call storage_add;
	[DTK_ActiveFactory,"copper",-(_materials select 1)] call storage_add;
	[DTK_ActiveFactory,"Gold",-(_materials select 2)] call storage_add;
	[DTK_ActiveFactory,"geld",-(_materials select 3)] call storage_add;

	_queue = DTK_ActiveFactory getVariable ["dtk_queue",[]];
	_current = _queue select _index;
	_current set [count _current,time + _time];
	_queue set [_index,_current];
	DTK_ActiveFactory setVariable ["dtk_queue",_queue,true];
	systemchat format["You have added one %1 to the production line",_item call config_DisplayName];
}else{
	systemchat "You are mising materials to manufacture this item";
};