_id = _this select 0; 
_data = (INV_ItemShops select _id) select 2;
shop_object = (INV_ItemShops select _id) select 0;

if (count _data > 1)then {
	createDialog "store";
	{
		_index = lbAdd [897, _x select 0 select 1];
		if (call (_x select 3)) then {
			lbSetData [897, _index, str _x];
			lbSetPicture [897, _index, format["\crp_data\images\tags\%1.paa",_x select 0 select 0]];
		}else{
			lbSetPicture [897, _index,"\ca\ui\data\ui_server_locked_ca.paa"];
		};
	} forEach _data;

}else{
	[(_data select 0)]call shops_openshop;
};