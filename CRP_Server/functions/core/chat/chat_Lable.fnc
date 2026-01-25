private ['_display','_control','_text'];

disableSerialization;

for "_i" from 0 to 1 step 0 do 
{
	while {!(isNull (findDisplay 63))} do 
	{
		_control = (findDisplay 63) displayCtrl 101;
		_control ctrlSetText (chat_channels select dtk_active_chat  select 0);
		_control ctrlSetTextColor (chat_channels select dtk_active_chat  select 2);
	};
};
