private ["_player","_item","_mag","_weap","_vcl","_bank","_governor"];

_player = _this select 0;
_item   = _this select 1;
_mag    = _this select 2;
_weap   = _this select 3;
_vcl    = _this select 4;
_bank   = _this select 5;

_governor = server getVariable ["governor",objNull];
if (isNull _governor || {_player != _governor}) exitWith {
	[_player,["Only the whitelisted Mayor (Governor) can change taxes."],{systemChat _this},false,false] call network_MPExec;
};

(INV_ItemTypenArray select 0) SET [2, _item];
(INV_ItemTypenArray select 1) SET [2, _vcl];
(INV_ItemTypenArray select 2) SET [2, _mag];
(INV_ItemTypenArray select 3) SET [2, _weap];
bank_steuer = _bank;

publicVariable "INV_ItemTypenArray";
publicVariable "bank_steuer";

["ALL",["dtk_client","Government","The Mayor (Governor) has changed the taxes."],"Main_Notification",true,false]call network_MPExec;

