private ["_warrants","_license","_notes","_houses"];

lbClear 2;
lbClear 3;
lbClear 4;

cdb_object = (CtrlText 1) call core_nametoplayer;
cdb_object = if (isNil "cdb_object")then {(CtrlText 1)call plates_plateToVehicle}else{cdb_object};

if (isNil "cdb_object" or {isNull cdb_object})exitWith {
	_index = lbadd [2, format ["Nothing found in Database for: %1",(CtrlText 1)]];
	lbSetColor [2,_index,[0.23,0.34,0.98, 1]];
};


if !(cdb_object isKindOf "Man")then{
	_data = (cdb_object getVariable "DTK_OwnerUID");
	_index = lbadd [2, format ["Vehicle Is Registered To: %1 <-- double click to search database",(_data select 3)]];
	lbSetData [2, _index, format["%1", (_data select 3)]];
	lbSetColor [2,_index,[0.23,0.34,0.98, 1]];
	_index = lbadd [2, format ["Type: %1",(_data select 1)call config_displayname]];
	lbSetColor [2,_index,[0.23,0.34,0.98, 1]];
};

_warrants = cdb_object getVariable ["cdb_warrants",[]];
_license = cdb_object getVariable ["cdb_license",[]];
_notes = cdb_object getVariable ["cdb_notes",[]];
_houses = cdb_object call house_address;

if (count _warrants > 0)then
{
	{
		_index = lbadd [2, format['Warrant: %1 for %2',_x select 0,[_x select 1]call main_formatMoney]];
		lbSetColor [2,_index,[0.23,0.34,0.98, 1]];
	}count _warrants;
}else{
	_index = lbadd [2, 'Warrants: None found'];
	lbSetColor [2,_index,[0.23,0.34,0.98, 1]];
};

lbadd [2, ''];

if (count _license > 0)then
{
	{
		_index = lbAdd [2,format["License: %1",_x call licenses_name]];
		lbSetColor [2,_index,[0.23,0.34,0.98, 1]];
	}count _license;
}
else
{
	_index = lbadd [3, 'License: None Found'];
	lbSetColor [3,_index,[0.23,0.34,0.98, 1]];
};

lbadd [2, ''];

if (count _notes > 0)then
{
	{
		_index = lbAdd [2,format['Note: %1 - By %2', (_x select 0),(_x select 1)]];
		lbSetColor [2,_index,[0.23,0.34,0.98, 1]];
	}count _notes;
}
else
{
	_index = lbadd [2, 'Notes: None Found'];
	lbSetColor [2,_index,[0.23,0.34,0.98, 1]];
};

lbadd [2, ''];

if (count _houses > 0)then
{
	{
		_index = lbAdd [2,format['House: %1 - %2 %3',_forEachIndex + 1,mapGridPosition _x,[_x]call locations_nearest]];
		lbSetColor [2,_index,[0.23,0.34,0.98, 1]];
	}forEach _houses;
}
else
{
	_index = lbadd [2, 'House: No Address'];
	lbSetColor [2,_index,[0.23,0.34,0.98, 1]];
};


