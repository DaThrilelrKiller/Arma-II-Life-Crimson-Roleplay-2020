/*
File: keypress_add.fnc
Desc: Adds a keypress event handler that is triggered when a key is pressed or released
Author: DaThrillerKiller -PureGaming Founder
Youtube: https://www.youtube.com/channel/UCY-d_qX9l2ABnJ3cDO7VUIQ
Email: dathrillerkiller@gmail.com 
Instagram: https://www.instagram.com/tuckeeeee

	Use Without Permission is prohibited

Prams: 
	0. Name - Open Ipad 
	1. Type - kp or kd - Keyup or Keydown
	2. Settings
	2.0 Key 
	2.1 Shift
	2.2 ctrl
	2.3 alt
	3. code that is fired when key is pressed
*/




private ["_name","_type","_settings","_key","_shift","_ctrl","_alt","_keyvarialbe","_code","_variable"];

/* Grab Pramerters that go a long with key press */
_name = _this select 0;
_type = _this select 1;
_settings = _this select 2;

/* figure out what key, and wether or not it uses ctrl,shift, or alt */
_key =  (_settings select 0)call keypress_number;
_shift = _settings select 1;
_ctrl = _settings select 2;
_alt = _settings select 3;

/* if _code pram is code, make it into a array */
_code = _this select 3;
_code = [_code,[[],_code]]select ((typeName _code) == "CODE");
_code set [count _code,_name];

_keyvarialbe = [format ["dtk_%1_%2",_type,_key],format ["dtk_%1_%2_%3_%4_%5",_type,_key,_shift,_ctrl,_alt]]select (_shift or _ctrl or _alt);


/* check if player has a key already saved, if not define one */
if (isNil {profileNamespace getVariable _name})then {
	profileNamespace setVariable [_name,_keyvarialbe];
};

_variable = missionnamespace getVariable [profileNamespace getVariable _name,[]];
_variable set [count _variable,_code];

missionnamespace setVariable [profileNamespace getVariable _name,_variable];
if !(_name in dtk_keypress)then {
	dtk_keypress set [count dtk_keypress,_name];
};