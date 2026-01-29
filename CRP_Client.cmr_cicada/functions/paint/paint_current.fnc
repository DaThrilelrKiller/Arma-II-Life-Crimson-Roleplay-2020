_textures = _this getVariable ["textures",[]];

{
	if (_x != "")then {
		paint_temp_vehicle SetObjectTexture[_forEachIndex,_x];
		dtk_paint set [_forEachIndex,_x];
	};
	_string = [_x,"(),"]call string_split;
	lbSetData [1500, _forEachIndex, format["%1",[parseNumber (_string select 6),parseNumber (_string select 7),parseNumber (_string select 8)]]];
}forEach _textures;