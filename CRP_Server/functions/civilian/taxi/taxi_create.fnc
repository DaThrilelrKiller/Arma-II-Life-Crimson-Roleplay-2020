_type 	  = taxi_units call bis_selectRandom;

_unit = (group player) createUnit [_type, _pos, [], 0, "FORM"];
_unit disableAI "MOVE";
_unit disableAI "TARGET";
														
_marker = createMarkerLocal ["taxi_marker",[0,0]];																																																	
_marker setMarkerShapeLocal "ICON";								
_marker setMarkerTypeLocal "Marker";										
_marker setMarkerColorLocal "ColorYellow";																														
_marker setMarkerTextLocal localize "STRS_workplacemission_taxi_marker_kunde";								
_marker SetMarkerPosLocal _pos;

_unit