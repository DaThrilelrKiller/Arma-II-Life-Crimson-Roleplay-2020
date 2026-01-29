disableSerialization;
private["_display"];
    _display = findDisplay 46;
if (not(isnil "mounted_keyUpHandler_id")) then {
_display displayRemoveEventHandler  ["keyUp", mounted_keyUpHandler_id];
mounted_keyUpHandler_id = nil;
};