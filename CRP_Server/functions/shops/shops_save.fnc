

{
    _object = _x select 0;
    _shops = _x select 2;

    {
        _shop = format["%1_%2_Stock",vehicleVarName _object,_forEachIndex];
        _items = _x select 1;
        _quantity = _object getVariable[_shop,[]];

        {
            if(_forEachIndex < count _quantity) then {
                _stock = _quantity select _forEachIndex;
                ["Shops",_shop, _x, _stock] call s_stats_write;
            };
        }forEach _items;

    }forEach _shops;
}forEach INV_ItemShops;