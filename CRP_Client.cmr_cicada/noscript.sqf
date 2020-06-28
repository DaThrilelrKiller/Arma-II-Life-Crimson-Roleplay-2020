private ["_data"];
_data = _this select 3;

if (typeName _data == "ARRAY")then {
	(_data select 0)spawn compile (_data select 1);
}else{
	call compile _data;
};