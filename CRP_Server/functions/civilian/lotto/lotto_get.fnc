private ["_c"];	
for "_c" from 0 to (count LottoArray - 1) do
{	
	if (((LottoArray select _c) select 0) == _this) exitWith { (LottoArray select _c) };
};