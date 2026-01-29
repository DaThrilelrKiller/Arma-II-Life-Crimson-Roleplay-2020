if (dtk_server)exitWith {};

(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call keypress_down"];
(findDisplay 46) displayAddEventHandler ["KeyUp", "_this call keypress_up"];