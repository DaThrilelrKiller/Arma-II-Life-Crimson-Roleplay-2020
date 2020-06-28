﻿private ["_unit","_escorting","_escort"];

_escorting = player getVariable "escorting";

if (!isNil "_escorting") exitWith {
	detach _escorting;
	_escorting setVariable ["escorting",nil,true];
	player setVariable ["escorting",nil,true];
};

_unit = cursorTarget;
if !(isPlayer _unit)exitWith {};
if !(_unit isKindOf "Man")exitWith {};

_escort = _unit getVariable "escorting";

if (isNil "_unit")exitWith {};
if (_unit distance player > 5) exitWith {};

if (!isNil "_escort") exitWith {
	systemchat format ["%1 is already being escorted by %2",name _unit,name _escort];
};

_unit attachTo [player,[0.6,0.3,0]]; 
hintSilent format ["%1 Attached!", name _unit];
_unit setVariable ["escorting",player,true];
player setVariable ["escorting",_unit,true];