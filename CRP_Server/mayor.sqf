_this = _this select 3;
_art  = _this select 0;
waitUntil {!isNil "INV_GetItemAmount"};
_geld = 'geld' call INV_GetItemAmount;

if (_art == "ClientWahl") then
{

	if (isNil("WahlSperre")) then
	{
		WahlSperre = false;
	};

	if (WahlSperre) exitWith {player groupChat "You just voted.";};
	_spielernum   = call compile (_this select 1);
	format["if (isServer) then {[0,1,2,[""ServerWahl"", %1, %2]] execVM ""mayor.sqf"";};", _spielernum, rolenumber] call OL_network_Swag;
	player groupChat format[localize "STRS_regierung_votedfor", (playerstringarray select _spielernum)];

	WahlSperre = true;
	sleep 30;
	WahlSperre = false;
};

if (_art == "ServerWahl") then
{

	_kandidatnum = (_this select 1);
	_waehlernum  = ((_this select 2)-1);

	for [{_i=0}, {_i < count(WahlArray)}, {_i=_i+1}] do
	{
		_arr = (WahlArray select _i);
		if (_waehlernum in _arr) exitWith {_arr = _arr - [_waehlernum];WahlArray SET [_i, _arr];};
	};

	WahlArray SET [_kandidatnum, ((WahlArray select _kandidatnum )+ [_waehlernum])];
};

if (_art == "serverloop") then
{
	_currentMayor = -1;

	while {true} do
	{
		for [{_i=0}, {_i < 10}, {_i=_i+1}] do
		{
			sleep 60;

			for [{_k=0}, {_k < count(WahlArray)}, {_k=_k+1}] do
			{
				if (not((playerstringarray select _k) call OL_ISSE_UnitExists)) then {WahlArray SET [_k, [] ];};
			};
		};

		_MaxStimmen = 1;
		_MaxPos     = -1;

		for [{_i=0}, {_i < count(WahlArray)}, {_i=_i+1}] do
		{
			if ( ((count (WahlArray select _i)) > _MaxStimmen) and ((playerstringarray select _i) call OL_ISSE_UnitExists) ) then
			{

				_MaxStimmen = (count (WahlArray select _i));
				_MaxPos     = _i;

			};

		};

		if (_MaxPos == -1) then
		{
			"hint localize ""STRS_regierung_nomajor"";" call OL_network_Swag;
			_currentMayor = -1;
		} else {

			if (_currentMayor == _MaxPos) then
			{
				"hint localize ""STRS_regierung_majorstays"";" call OL_network_Swag;
			} else {
				_currentMayor = _MaxPos;
				_MayorString  = (playerstringarray select _currentMayor);
				format["hint format[localize ""STRS_mayor_new"", ""%3"", %2]; if ((rolenumber-1) == %1) then {isMayor = true; true call OL_misc_TurnMayor;} else {isMayor = false;false call OL_misc_TurnMayor;};", _MaxPos, _MaxStimmen, _MayorString] call OL_network_Swag;
			};
		};

		MayorNumber = _currentMayor;
		PUBLICVARIABLE "MayorNumber";
		sleep 1;
	};
};

if (_art == "clientgesetz") then
{
	_nummer = _this select 1;
	_text   = _this select 2;
	if (_nummer == -1) exitWith {};
	if ((_text call OL_ISSE_str_Length) > 60) exitWith {player groupChat localize "STRS_text_zu_lang";};
	format ["GesetzArray SET [%1, ""%2""];
	hint format [localize ""STRS_gilde_gesetze_public"", %1, ""%2""];", _nummer, _text] call OL_network_Swag;
};

if (_art == "steuernMayor") then
{
	_item = _this select 1;
	_mag  = _this select 2;
	_weap = _this select 3;
	_vcl  = _this select 4;
	_bank = _this select 5;
	format ["
	(INV_ItemTypenArray select 0) SET [2, %1];
	(INV_ItemTypenArray select 1) SET [2, %2];
	(INV_ItemTypenArray select 2) SET [2, %3];
	(INV_ItemTypenArray select 3) SET [2, %4];
	bank_steuer = %5;
	hint ""The governor has changed the taxes!"";
	", _item, _vcl, _mag, _weap, _bank] call OL_network_Swag;
};
