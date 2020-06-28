_control = (findDisplay 489) displayCtrl 65;

_red = sliderPosition 11;
_green = sliderPosition 12;
_blue = sliderPosition 10;
paint_selection  = lbText [1500, (lbCursel 1500)];
paint_selection  = [paint_selection," "]call string_split;
paint_selection = parseNumber (paint_selection select 0);

lbSetData [1500, paint_selection, format["%1",[_red,_green,_blue]]];

paint_color =  format["#(ARGB,8,8,3)color(%1,%2,%3,1)",_red,_green,_blue];

_control ctrlSetBackgroundColor [_red, _green, _blue, 1];
paint_temp_vehicle setObjectTexture [paint_selection, paint_color];
dtk_paint set[paint_selection,paint_color];