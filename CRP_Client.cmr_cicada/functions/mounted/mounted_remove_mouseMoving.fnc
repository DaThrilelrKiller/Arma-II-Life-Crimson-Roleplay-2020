disableSerialization;
private["_display"];
    _display = findDisplay 46;
if (not(isnil "mounted_mouseMoving_id")) then {
_display displayRemoveEventHandler  ["mouseMoving", mounted_mouseMoving_id];
mounted_mouseMoving_id = nil;
};