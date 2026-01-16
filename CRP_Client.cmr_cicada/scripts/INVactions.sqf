private ["_action","_item","_textamount","_player","_filename","_itemamount"];
_action = _this select 0;
_item   =  call compile (_this select 1);
_item = _item select 0;
_textamount = _this select 2;                 

if (!(_textamount call storage_isNumber))   exitWith {systemChat  localize "STRS_inv_no_valid_number";};
_textamount = parseNumber _textamount;
_itemamount = ([player,_item] call storage_amount);
_textamount = if (_textamount > _itemamount) then {_itemamount}else {_textamount};
_player = _this select 3;
if (player call isse_isvictim) exitWith {systemChat  localize "STRS_inv_cannotUseNow";};
INV_InventarGiveReceiver = _player;

if (_action == "use") then 
{
	_filename = _item call config_code;

	if (isNil "dtk_use" || {scriptDone dtk_use})then {
		if (isNil format ["%1",_filename])then {
			dtk_use = ["use", _item, _textamount] execVM format["scripts\items\%1.sqf",_filename];
		}else{
			dtk_use = ["use", _item, _textamount]spawn call compile _filename;
		};
		dtk_use_item = [_item,_textamount];
	}else{
		_name = (dtk_use_item select 0)call config_DisplayName;
		systemchat format ["Please wait you are currently using %1 of %2",(dtk_use_item select 1),_name];
	};
};

if (_action == "drop") then 
{
	[_item, _textamount] spawn items_drop;
};

if (_action == "give") then 
{
	["uebergabe", _item, _textamount, _player] execVM "scripts\give.sqf";
};
