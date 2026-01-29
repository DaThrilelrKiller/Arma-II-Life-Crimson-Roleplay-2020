private ["_Condition","_text"];
_Condition = call compile(_this select 0);
_text = _this select 1;
_mode = _this select 2;

if (isNil "_Condition")exitWith {};
if (_Condition)then 
{
	switch(_mode)do
	{
		case 1:
		{
			systemChat _text;	
		};
		case 2:
		{
			player sidechat _text;
		};
		case 3:
		{
			server globalChat _text;
		};
	};
};