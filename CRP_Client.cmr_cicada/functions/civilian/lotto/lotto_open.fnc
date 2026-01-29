createDialog 'lotto'; 

{
	_index = lbAdd [1, format["%1 ($%2)", _x select 0,_x select 1]];					
	lbSetData [1, _index, str _x];
}forEach LottoArray;

lbSetCurSel [1, 0];