{
	_Array = _x;
	_Scriptname = (_x select 0);
	_trunk = (_x select 1);
	_upgrades = (_x select 2);
	_name = _Scriptname call config_displayname;
	_classname = _Scriptname call config_class;
	
	if (_classname isKindOf DTK_SaveKind)then {
		_picture = getText (configFile >> "cfgVehicles" >> _classname >> "picture");
		_index = lbAdd [1, format["Name: %1 Trunk: %2 SpeedUpgrade: %3", _name, _trunk,_upgrades]];				
		lbsetPicture[1,_index,_picture];
		lbSetData [1, _index,format ['%1',[_Array,_forEachIndex]]];	
	};
}forEach _this;