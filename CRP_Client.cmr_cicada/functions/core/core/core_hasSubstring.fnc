
    private ["_str","_sub","_a","_b","_i","_j","_match"];

    _str = toArray (_this select 0);
    _sub = toArray (_this select 1);

    _a = count _str;
    _b = count _sub;

    for "_i" from 0 to (_a - _b) do {
        _match = true;

        for "_j" from 0 to (_b - 1) do {
            if ((_str select (_i + _j)) != (_sub select _j)) exitWith {
                _match = false;
            };
        };

        if (_match) exitWith { true };
    };

    false
