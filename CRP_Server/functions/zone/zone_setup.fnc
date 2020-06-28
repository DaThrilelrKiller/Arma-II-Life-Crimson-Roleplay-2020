
{
	_marker = createMarker [(_x select 2), (_x select 0)];
	_marker setMarkerType (_x select 3);
	_marker setMarkerSize (_x select 1);
	if (_x select 4 != "")then {
		_marker setMarkerColor (_x select 4);
	};
	if (_x select 5 != "")then {
		_marker setMarkerShape (_x select 5);
	};
}forEach zone_markers;
