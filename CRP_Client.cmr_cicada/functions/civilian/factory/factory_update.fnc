factory_update = {
private ["_data","_item","_materials","_info","_eta"];
_data = call compile lbData [1,  lbCurSel 1];
_item = _data select 0;
_materials = _item call factory_materials; 
_info = call factory_getInfo;
_eta = call factory_ETA;

lbClear 2;
lbAdd [2, format["Available: %1", _info select 0]];
lbAdd [2, format["Pending: %1",_info select 1]];
lbAdd [2, format["In production: %1", _info select 2]];
lbAdd [2, format["ETA: %1 seconds", round _eta]];
lbAdd [2, ""];
lbAdd [2,"Materials:"];
lbAdd [2, format["Iron: %1", _materials select 0]];
lbAdd [2, format["Copper: %1", _materials select 1]];
lbAdd [2, format["Gold: %1", _materials select 2]];
lbAdd [2, format["Money: %1", _materials select 3]];
};