private ["_config","_class","_return","_name","_hintPoints"];

_config = configFile >> "CfgVehicles" >> (typeOf _this);
_return = [];

while {isClass _config} do
{
	_hintPoints = _config >> "HitPoints";
	for "_i" from 0 to (count _hintPoints)-1 do {
		_class = _hintPoints select _i;	
		_name = configName _class;
		_name = getText (_hintPoints >> _name >> "Name");
		if !(_name in _return)then {
			_return set [count _return,_name];
		};
		
	};
	_config = inheritsFrom _config;
};

_return




