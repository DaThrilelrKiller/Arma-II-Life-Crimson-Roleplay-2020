disableSerialization;
private["_display"];
    _display = findDisplay 46;
if (not(isnil "mounted_keyDownHandler_id")) then {
_display displayRemoveEventHandler  ["keyDown", mounted_keyDownHandler_id];
mounted_keyDownHandler_id = nil;
};