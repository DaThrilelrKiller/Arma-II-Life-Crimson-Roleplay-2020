private["_data"];
_data = _this;
private["_display"];
disableSerialization;
    _display = findDisplay 46;
if ( isnil "mounted_keyUpHandler_id" ) then {
mounted_keyUpHandler_id = _display displayAddEventHandler  ["keyUp", format["[_this, %1] call mounted_keyUpHandler", _data]];
};