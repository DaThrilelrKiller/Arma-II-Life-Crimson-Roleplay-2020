private["_data"];
_data = _this;
disableSerialization;
private["_display"];
    _display = findDisplay 46;
if ( isnil "mounted_mouseMoving_id" ) then {
mounted_mouseMoving_id = _display displayAddEventHandler  ["mouseMoving", format["[_this, %1] call mounted_mouseMoving_handler", _data]];
};