private ["_item","_material","_return","_need"];

_item = _this;
_material = _item call factory_materials; 

_storage = [
[DTK_ActiveFactory,"iron"] call storage_amount,
[DTK_ActiveFactory,"copper"] call storage_amount,
[DTK_ActiveFactory,"Gold"] call storage_amount,
[DTK_ActiveFactory,"geld"] call storage_amount
];

_return = {
	_need = _material select _forEachIndex;
	if !(_x >= _need)exitWith {false};
	true
}forEach _storage;

_return