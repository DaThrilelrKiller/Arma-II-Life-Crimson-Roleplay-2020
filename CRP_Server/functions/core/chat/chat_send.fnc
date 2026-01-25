if (dtk_server)exitWith {};

_text = _this select 0;
_condition = _this select 1;
_pos = if (vehicle player == player)then{[safeZoneX,SafeZoney]}else{[safeZoneX,SafeZoney*0.4]};

if !(call compile _condition)exitWith {};

if (isNil "chat_messages")then {
	chat_messages = [];
};

_message = "";
chat_messages set [count chat_messages,_text];

{_message = _message + _x}forEach chat_messages;
["chat_messages",13]call array_trim;

12 cutRsc ["better_chat", "PLAIN"];
_display = (uiNamespace getVariable 'better_chat');
_control = _display displayCtrl 20;
_control ctrlSetPosition _pos;
_control ctrlSetStructuredText parseText _message;
_control ctrlCommit 0;