private["_unit","_loadout","_items","_weapons","_license","_bounties","_warrants","_vehicle","_likelihood","_clothing","_bankBalance","_gangAffiliation","_aggressionLevel","_skillLevel","_weightedLoadouts","_selectedLoadout"];

_unit = _this select 0;

/* Build weighted loadout array based on likelihood */
_weightedLoadouts = [];
{
	_loadoutData = call _x;
	_likelihood = if (count _loadoutData > 6) then {_loadoutData select 6} else {5}; /* Default likelihood 5 if not specified */
	
	/* Add this loadout to weighted array (likelihood) times */
	for "_i" from 1 to _likelihood do {
		_weightedLoadouts set [count _weightedLoadouts, _x];
	};
}forEach DTK_CIV_Loadouts;

/* Select random loadout from weighted array */
_selectedLoadout = _weightedLoadouts call BIS_selectRandom;
_loadout = call _selectedLoadout;

_items =  _loadout select 0;
_weapons =  _loadout select 1;
_license =  _loadout select 2;
_bounties = if (count _loadout > 3) then {_loadout select 3} else {[]};
_warrants = if (count _loadout > 4) then {_loadout select 4} else {[]};
_vehicle = if (count _loadout > 5) then {_loadout select 5} else {""};
_clothing = if (count _loadout > 7) then {_loadout select 7} else {""};
_bankBalance = if (count _loadout > 8) then {_loadout select 8} else {0};
_gangAffiliation = if (count _loadout > 9) then {_loadout select 9} else {""};
_aggressionLevel = if (count _loadout > 10) then {_loadout select 10} else {2};
_skillLevel = if (count _loadout > 11) then {_loadout select 11} else {2};

/* Apply items */
{
	_amount = _x select 1;

	if (typename (_x select 0) == "ARRAY" ) then {
		{
			[_unit,_x select 0,_amount]call storage_add;
		}count (_x select 0);
	}else {
		[_unit,_x select 0,_amount]call storage_add;
	};
}count _items;

/* Apply weapons */
{
	if ([(_x select 0),"Rifle"]call holster_kind || {[(_x select 0),"Pistol"]call holster_kind}) then {
		_unit addWeapon ((_x select 0)call config_class);
	} else {
		_unit addMagazine [((_x select 0)call config_class), (_x select 1)];		
	};
}count _weapons;

/* Apply licenses */
{
	[_unit,_x]call licenses_add;
}count _license;

/* Apply bounties/warrants */
_warrantsList = [];
/* Add bounties (with amounts) */
{
	_warrantsList set [count _warrantsList, _x];
}forEach _bounties;
/* Add warrants (without amounts, set to 0) */
{
	_warrantsList set [count _warrantsList, [_x, 0]];
}forEach _warrants;
/* Set warrants variable */
if (count _warrantsList > 0) then {
	_unit setVariable ['cdb_warrants', _warrantsList, true];
};

/* Store vehicle preference (will be used in spawn function) */
if (_vehicle != "") then {
	_unit setVariable ["dtk_loadout_vehicle", _vehicle, true];
};

/* Store clothing preference */
if (_clothing != "") then {
	_unit setVariable ["dtk_loadout_clothing", _clothing, true];
};

/* Store gang affiliation */
if (_gangAffiliation != "") then {
	_unit setVariable ["dtk_gang", _gangAffiliation, true];
};

/* Store aggression and skill levels */
_unit setVariable ["dtk_aggression", _aggressionLevel, true];
_unit setVariable ["dtk_skill", _skillLevel, true];