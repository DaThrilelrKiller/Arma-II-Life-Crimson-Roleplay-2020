private ["_string","_lenght","_array"];

_string = _this select 0;
_lenght = _this select 1;
_array = toArray _string;

if (count _array == _lenght)exitWith {_string};

if (count _array > _lenght)then
{
_array resize _lenght;
}
else
{
	for "_i" from 1 to (_lenght - (count _array)) step 1 do 
	{
		_array = _array + [32];
	};
};

toString _array;
