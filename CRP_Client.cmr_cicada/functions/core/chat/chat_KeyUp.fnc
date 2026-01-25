private ["_Key","_return"];
_Key = _this select 1;
_return = false;

if (_Key == 28)then {
	_display = (findDisplay 24);
	_chat = _display displayCtrl 101;
	(ctrlText _chat) call chat_commands;
	_return = true;
 }; 
 
if (([200,201] find _Key) > -1)then {
	if (count chat_channels >= dtk_active_chat + 1)then {
		dtk_active_chat = dtk_active_chat + 1;
	}else{
		dtk_active_chat = 0;
	};
	_return = true;
}; 
 
if (([208,209] find _Key) > -1)then {
	if (dtk_active_chat >= 0)then {
		dtk_active_chat = dtk_active_chat - 1;
	}else{
		dtk_active_chat = 0;
	};
	_return = true;
}; 
 
 _return
 