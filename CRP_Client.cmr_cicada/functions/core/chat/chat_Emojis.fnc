_return = "";
_text = _this;

{
	_emojis = _x select 0;
	_images = _x select 1;
	{
		if (_x in _emojis)then {
		_text set [_forEachIndex,format ["<img image='\crp_data\images\emoji\%1'/>",_images call bis_selectRandom]];
		};
	}forEach _text;
}forEach chat_emojis_list;

{
	_return = _return + format ["%1 ",_x];
}forEach _text;

_return