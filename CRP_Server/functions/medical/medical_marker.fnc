_unit = _this select 0;
_corps = _this select 1;

deleteMarker ("medical_" + name _unit);

_markerobj = createMarker [("medical_" + name _unit), getPos _corps];
_markerobj setMarkerType "mil_warning";
_markerobj setMarkerColor "colorRed";
_markerobj setMarkerText format ["%1 Unconscious", name _unit];