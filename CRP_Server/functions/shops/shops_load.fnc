


{
    _object = _x select 0;
    if (!isNil "_object") then {
        _shops = _x select 2;
        _varName = vehicleVarName _object;
        if (_varName == "") then {
            _varName = format["Shop_Unknown_%1", _object];
        };

        {
            _shop = format["%1_%2_Stock",_varName,_forEachIndex];
            _items = _x select 1;
            _quantity = [];
            {
                _stock = ["Shops",_shop, _x,round (random 20) + 3]call s_stats_read;
                _quantity set[_forEachIndex,_stock];
            }forEach _items;

            _object setVariable[_shop,_quantity,true];

        }forEach _shops;
    };
}forEach INV_ItemShops;