private["_art","_item","_deleted"];
_art = _this select 0;

if (_art == "use") then {
	_item    = _this select 1;
	_deleted = 0;

	if (vehicle player == player) then {	
		{	
			deleteVehicle _x;
			_deleted = _deleted + 1;
		} count (player nearObjects ["Suitcase", 10]);

		systemChat  format[localize "STRS_inv_items_itemdeleted", _deleted];
	} else {
		systemChat  "You Must Be On Foot";
	};

	if (_deleted > 0) then 
	{
		[player,_item,-1] call storage_add;
	};
};