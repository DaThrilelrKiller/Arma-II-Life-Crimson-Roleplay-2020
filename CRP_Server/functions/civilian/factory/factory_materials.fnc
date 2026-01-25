private ["_item","_cost","_type","_class","_size","_config","_fuel","_seats","_iron","_copper","_gold","_modes","_lock","_range"];
_item = _this;
_cost = _item call config_buyCost;
_type = _item call config_type;
_class = _item call config_class;
_size = (sizeOf _class)min 1;

if (_type == "vehicle")then {
	_config = configFile >> "CfgVehicles" >> _class;
	_fuel = getNumber (_config >> "fuelCapacity");
	_seats = getNumber (_config >> "transportSoldier");
	_iron = round(_fuel * 0.1) + floor(_seats/2);
	_copper = round(_fuel * 0.1) + _seats;
	_gold = round(_fuel * 0.05) + round(_seats/3);
};

if (_type == "weapon")then {
	_config = configFile >> "CfgWeapons" >> _class;
	_modes = count (getArray (_config >> "modes"));
	_lock = getNumber (_config >> "canLock");
	_range = getNumber (_config >> "midRange");
	_iron = _modes + _lock;
	_copper = round(_range * 0.02) + _lock * 2;
	_gold = _lock + round(_range * 0.03);
};
[_iron,_copper,_gold,_cost]