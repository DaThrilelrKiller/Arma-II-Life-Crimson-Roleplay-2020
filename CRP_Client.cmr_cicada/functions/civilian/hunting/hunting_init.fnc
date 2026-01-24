

{
    private ["_legalActions", "_illegalActions", "_actionIndices", "_marker", "_markerName", "_building"];
    
    _building = _x;
    
    _legalActions = [
        ["Process Beef into Steak", "rawcow_tagged", "beef_steak", 2],
        ["Process Beef into Burger", "rawcow_tagged", "beef_burger", 2],
        ["Process Beef into Jerky", "rawcow_tagged", "beef_jerky", 3],
        ["Process Goat into Curry", "rawgoat_tagged", "goat_curry", 2],
        ["Process Goat into Stew", "rawgoat_tagged", "goat_stew", 2],
        ["Process Rabbit into Stew", "rawrabbit_tagged", "rabbit_stew", 2],
        ["Process Rabbit into Pie", "rawrabbit_tagged", "rabbit_pie", 2],
        ["Process Sheep into Lamb Chops", "rawsheep_tagged", "lamb_chops", 2],
        ["Process Sheep into Lamb Roast", "rawsheep_tagged", "lamb_roast", 3],
        ["Process Boar into Sausage", "rawboar_tagged", "boar_sausage", 2],
        ["Process Boar into Ribs", "rawboar_tagged", "boar_ribs", 3]
    ];
    
    _illegalActions = [
        ["Process Raw Cow into Steak", "rawcow", "beef_steak", 2],
        ["Process Raw Goat into Curry", "rawgoat", "goat_curry", 2],
        ["Process Raw Rabbit into Stew", "rawrabbit", "rabbit_stew", 2],
        ["Process Raw Sheep into Lamb Chops", "rawsheep", "lamb_chops", 2],
        ["Process Raw Boar into Sausage", "rawboar", "boar_sausage", 2]
    ];
    
    if (_forEachIndex % 2 == 0) then {
        _markerName = format["game_processing_%1", _forEachIndex];
        _marker = [_markerName, getPos _building, nil, nil, "ColorGreen", "mil_dot", nil, "Game Processing"] call core_createMarkerLocal;
    } else {
        _markerName = format["illegal_game_processing_%1", _forEachIndex];
        _marker = [_markerName, getPos _building, nil, nil, "ColorRed", "mil_dot", nil, "Illegal Game Processing"] call core_createMarkerLocal;
    };
    
    _maxCount = ((count _legalActions) max (count _illegalActions)) * 2;
    _actionIndices = [];
    for "_i" from 0 to (_maxCount - 1) do {
        _actionIndices set [count _actionIndices, _i];
    };
    
    {
        if (_forEachIndex % 2 == 0) then {
            _legalIndex = _forEachIndex / 2;
            if (_legalIndex < count _legalActions) then {
                _action = _legalActions select _legalIndex;
                _building addAction[_action select 0, "noscript.sqf", format["[%1,%2,%3,'DTK_License_civ_butcher']spawn hunting_processLegal", _action select 1, _action select 2, _action select 3], 25, false, true, "LeanRight", "player distance _target < 10"];
            };
        } else {
            _illegalIndex = (_forEachIndex - 1) / 2;
            if (_illegalIndex < count _illegalActions) then {
                _action = _illegalActions select _illegalIndex;
                _building addAction[_action select 0, "noscript.sqf", format["[%1,%2,%3]spawn hunting_processIllegal", _action select 1, _action select 2, _action select 3], 25, false, true, "LeanRight", "dtk_civ && {player distance _target < 10"];
            };
        };
    } forEach _actionIndices;
    
} forEach nearestObjects[dtk_center, ["Land_HouseV_3I3"], (dtk_center select 0)];
