_pos = if (vehicle player == player)then{[safeZoneX,SafeZoney]}else{[safeZoneX,SafeZoney*0.4]};
_message = "";

{_message = format["%1%2",_message,_x];}forEach chat_messages;
disableSerialization;

12 cutRsc ["better_chat", "PLAIN"];
_display = (uiNamespace getVariable 'better_chat');
_control = _display displayCtrl 20;
_control ctrlSetPosition _pos;
_control ctrlSetStructuredText parseText _message;
_control ctrlCommit 0;
