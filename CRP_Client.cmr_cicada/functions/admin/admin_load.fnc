private ["_text","_whitelist","_index"];

{
	_text = _x select 0;
	_whitelist = _x select 1;
	
	if (call _whitelist)then {
		_index = lbAdd [1500, _text];															
		lbSetData [1500, _index,_text];
	};
	
}foreach admin_actions;	

[]spawn admin_handler;