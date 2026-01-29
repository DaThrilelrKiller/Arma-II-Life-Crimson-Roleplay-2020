// Sort array in descending order by a specific index
// Parameters: [array, index]
// Returns: sorted array
private ["_array","_index","_sorted","_i","_j","_temp","_swapped"];

_array = _this select 0;
_index = _this select 1;

_sorted = +_array; // Copy array

// Bubble sort (descending)
_i = 0;
while {_i < (count _sorted - 1)} do {
	_j = 0;
	_swapped = false;
	while {_j < (count _sorted - _i - 1)} do {
		if ((_sorted select _j select _index) < (_sorted select (_j + 1) select _index)) then {
			_temp = _sorted select _j;
			_sorted set [_j, _sorted select (_j + 1)];
			_sorted set [(_j + 1), _temp];
			_swapped = true;
		};
		_j = _j + 1;
	};
	if (!_swapped) exitWith {};
	_i = _i + 1;
};

_sorted
