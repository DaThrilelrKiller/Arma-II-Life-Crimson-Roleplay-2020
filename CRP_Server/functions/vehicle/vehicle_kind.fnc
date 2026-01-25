private ["_type"];

_type = typeOf _this;
if (_type isKindOf "Land")exitWith {"Land"};
if (_type isKindOf "Helicopter")exitWith {"Helicopter"};
if (_type isKindOf "Boat")exitWith {"Boat"};
if (_type isKindOf "Plane")exitWith {"Plane"};