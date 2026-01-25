private["_data", "_display"];
_data = _this;

disableSerialization;
    _display = findDisplay 46;
if ( isnil "mounted_keyDownHandler_id" ) then {
mounted_keyDownHandler_id = _display displayAddEventHandler  ["keyDown", format["[_this, %1] call mounted_keyDownHandler", _data]];
};