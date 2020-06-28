private["_num"];

_num = _this call string_GetInteger;	
(  (_num select 0) and ((_num select 1) == (round (_num select 1)))  )
