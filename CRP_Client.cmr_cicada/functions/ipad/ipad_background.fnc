_index = background_id + 1;

if (count ipad_backgrounds > _index)then {
	background_id = _index;
}else{
	background_id = 0;
};

_bg = ipad_backgrounds select background_id;
ctrlSetText [156,_bg];
