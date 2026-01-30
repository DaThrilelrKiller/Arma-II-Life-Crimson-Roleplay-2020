

{
    _object = _x select 0;
    _shops = _x select 2;
    _varName = vehicleVarName _object;
    if (_varName == "") then {
        _varName = format["Shop_Unknown_%1", _object];
    };

    {
        _shop = format["%1_%2_Stock",_varName,_forEachIndex];
        _items = _x select 1;
        if (typeName _items == "STRING") then {
            _items = call compile _items;
        };
        _quantity = _object getVariable[_shop,[]];

        if (!isNil "_items" && {typeName _items == "ARRAY"}) then {
            {
                _stock = if(_forEachIndex < count _quantity) then {
                    _quantity select _forEachIndex
                } else {
                    0
                };
                ["Shops",_shop, _x, _stock] call s_stats_write;
            }forEach _items;
        };

    }forEach _shops;
}forEach INV_ItemShops;