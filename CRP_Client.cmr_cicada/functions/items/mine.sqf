/*
	Generic resource drilling/collection script used by oil rigs (and now gas rigs).

	Called via addAction with argument in _this select 3:
	- "oil" -> resource "Oil"
	- "gas" -> resource "RawGas"
*/

private ["_minearray","_isInArea","_amount","_resource","_max","_infos","_name","_itemweight","_pos","_object","_class","_icon","_arg"];
if(working)exitwith{systemChat  "You are collecting a resource, please wait";};
working=true;

_arg = _this select 3;

// Gas extraction should deposit directly into inventory (no suitcase pickup step)
if (!isNil "_arg" && {toLower format["%1",_arg] == "gas"}) exitWith {
	private ["_target","_caller","_amountGas","_ok","_i","_cancel"];
	_target = _this select 0;
	_caller = _this select 1;
	_cancel = false;

	// 3–5 RawGas
	_amountGas = 3 + floor (random 3);

	// Short timed action with basic cancel conditions
	if (primaryWeapon _caller == "" && {secondaryWeapon _caller == ""})then{
		_caller playMove "AmovPercMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon";
	}else{
		_caller playMove "AinvPknlMstpSlayWrflDnon";
	};

	for "_i" from 1 to 5 do {
		if (!alive _caller) exitWith { _cancel = true; };
		if (vehicle _caller != _caller) exitWith { _cancel = true; };
		if (_caller distance _target > 5) exitWith { _cancel = true; };
		titleText [format ["Extracting Gas... %1%2", _i * 20, "%"], "PLAIN DOWN", 0.1];
		sleep 1;
	};

	if (_cancel) exitWith {
		titleText ["Extraction cancelled.", "PLAIN DOWN", 0.5];
		working = false;
	};

	_ok = [_caller,"RawGas",_amountGas] call storage_add;
	if (!_ok) then {
		systemChat "Your inventory is full. Free up space to extract Raw Gas.";
	} else {
		systemChat format ["Extracted %1 Raw Gas.", _amountGas];
	};

	working = false;
};

_minearray = {
	if (player distance (getMarkerPos ((_x select 0) select 0)) < ((_x select 0) select 1) && dtk_civ) exitwith {
		_x
	};
	[]
}forEach miningarray;

_isInArea = if (count _minearray > 0)then {true}else{false};
_amount = floor (random 2)+1;

if (!isNil "_arg") then {
	_isInArea = true;
	_resource = switch (toLower format["%1",_arg]) do {
		case "gas": {"RawGas"};
		default {"Oil"};
	};
	_max = 12;
} else {
	_resource = _minearray select 1;
	_max      = _minearray select 2;
};

_infos    = _resource call config_array;
_name     = (_infos call config_displayname);
_itemweight = (_infos call config_weight)*_amount;
_class = "Suitcase";
_icon = format ["\data\images\items\%1",[_resource]call config_image];

if (_isInArea) exitwith {
	for [{_i=0}, {_i < (floor(random 5))}, {_i=_i+1}] do 
	{
		titletext ["Machine Running...", "PLAIN DOWN", 1];
		sleep 5;
		titletext [format ["The Machine has collected %1!", _resource], "PLAIN"];
		systemChat  format["There is %1 %2s on the ground collect them.", _amount, _name];

		_pos = getposASL player;
		_object = _class createvehicle (position player);
		_object setPos [ getPos _object select 0, (getPos _object select 1)+4, (getPos _object select 2)];
			
		_object call core_setVarName; 
		["ALL",[_object,['','noscript.sqf',format['%1 spawn items_pickup',[_object, _resource, _amount]],25,false,true,'LeanRight',format ['player distance _target < 5 && {!([_target,"Pick up %1 (E)","%2"]call tag_show)}',_name,_icon]]],"network_addAction",false,true]call network_MPExec;
		titletext ["Restart the machine it has shut down...", "PLAIN DOWN", 3];
	};
	working=false;
};

systemChat  "You are not near a resource area.";
working=false;

