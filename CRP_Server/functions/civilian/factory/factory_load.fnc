private ['_data','_items','_workers','_cost','_time','_index','_name','_queue','_queueSet'];

_data = DTK_Factorys select dtk_fac;
DTK_ActiveFactory = _data select 0;
_items = _data select 3;
_workers = DTK_ActiveFactory getVariable['dtk_workers',1];
_queue = DTK_ActiveFactory getVariable ['dtk_queue',[]];
_queueSet = (count _queue == 0);

{
	_name = _x call config_displayName;
	_cost = (_x call config_buycost) * 0.5;
	_time = round (_cost  * 0.01125);
	_time = round(_time/ _workers);
	
	if(_time >  DTK_MaxFacTime)then{_time = DTK_MaxFacTime};
		
	_index = lbAdd [1, format['%1 ($%2, %3 mins)',_name,_cost,_time]];
	lbSetData [1, _index,str[_x,_cost,(_time * 60)]];
	
	if (_queueSet)then {
		_queue set [_forEachIndex,[]];
	};
	
	if (_x call factory_hasMaterial)then {
		lbSetColor [1,_index,[0,1,0, 1]];
	};
	if (_forEachIndex call factory_ItemsDone)then {
		lbSetColor [1,_index,[0,0,1, 1]];
	};
	
	
}forEach _items;

lbSetCurSel [1, 0];

DTK_ActiveFactory setVariable ['dtk_queue',_queue,true];